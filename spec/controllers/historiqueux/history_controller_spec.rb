require 'spec_helper'

module Historiqueux
  describe HistoryController do

    routes { Historiqueux::Engine.routes }

    before(:each) do

      @dummy_model = mock_model(DummyModel)
      @horses1 = mock_model(Horse)
      @horses2 = mock_model(Horse)
      @horses = [@horses1, @horses2]

      @version = mock_model(PaperTrail::Version)
      @preceding_version = mock_model(PaperTrail::Version)
      @history = [@preceding_version, @version]

      @horse_version = mock_model(PaperTrail::Version, {:item_type => 'Horse'})
      @horse_preceding_version = mock_model(PaperTrail::Version, {:item_type => 'Horse'})
      @horses_history = [@horse_preceding_version, @horse_version]

    end

    describe "GET 'index'" do

      it "doit fetché la ressource passé en paramètre, le layout de l'application hôte sera utilisé" do

        DummyModel.should_receive(:find).with('1').and_return(@dummy_model)
        @dummy_model.stub(:versions) { @history }
        get 'index', 'resource' => 'dummy_model', 'resource_id' => '1'

        assert_template layout: 'application'

      end

      it "si l'appel provient d'un call Ajax, on n'affiche pas de layout" do

        DummyModel.should_receive(:find).with('1').and_return(@dummy_model)
        @dummy_model.stub(:versions) { @history }

        xhr :get, 'index', 'resource' => 'dummy_model', 'resource_id' => '1'

        assert_template layout: false

      end

    end

    describe "GET 'index relations'" do

      it "doit fetché la ressource passé en paramètre et la liste des entités de la relation demandée,
          le layout de l'application hôte sera utilisé" do

        DummyModel.should_receive(:find).with('1').and_return(@dummy_model)
        @dummy_model.stub(:versions) { @history }

        @dummy_model.should_receive(:horses).and_return(@horses)

        @horses1.stub(:versions) { @horses_history }
        @horses2.stub(:versions) { @horses_history }

        get 'index_relations', 'resource' => 'dummy_model', 'resource_id' => '1', :relation_resource => 'horses'

        assert_template layout: 'application'

      end

      it "si l'appel provient d'un call Ajax, on n'affiche pas de layout" do

        DummyModel.should_receive(:find).with('1').and_return(@dummy_model)
        @dummy_model.stub(:versions) { @history }

        @dummy_model.should_receive(:horses).and_return(@horses)

        @horses1.stub(:versions) { @horses_history }
        @horses2.stub(:versions) { @horses_history }

        xhr :get, 'index_relations', 'resource' => 'dummy_model', 'resource_id' => '1', :relation_resource => 'horses'

        assert_template layout: false

      end

    end

    describe "Comportement du 'show'" do

      it "doit fetché les ressource passé en paramètre ainsi que la version de l'historique sélectionné avec sa version
          précédente et sa version courante" do

        subject.should_receive(:fetch_resource).and_return(@dummy_model)
        @dummy_model.stub(:versions) { @history }
        @history.stub(:where).and_return(@history)
        @history.should_receive(:first).and_return(@preceding_version)
        @preceding_version.should_receive(:next).and_return(@version)

        get 'show', 'resource' => 'dummy_model', 'resource_id' => '1', 'version_id' => '1'

        assert_template layout: 'application'

      end

      it "si l'appel provient d'un call Ajax, on n'affiche pas de layout" do

        subject.should_receive(:fetch_resource).and_return(@dummy_model)
        @dummy_model.stub(:versions) { @history }
        @history.stub(:where).and_return(@history)
        @history.should_receive(:first).and_return(@preceding_version)
        @preceding_version.should_receive(:next).and_return(@version)

        xhr :get, 'show', 'resource' => 'dummy_model', 'resource_id' => '1', 'version_id' => '1'

        assert_template layout: false


      end

    end

    describe "Comportement de la méthode 'classify_namespace'" do

      it "s'il n'y a pas de namespace, on fait un simple classify" do
        subject.classify_namespace('dummy_model').should eq 'DummyModel'
        subject.classify_namespace('customer').should eq 'Customer'
      end

      it "s'il y a un namespace, on fait un classify sur tous les éléments" do
        subject.classify_namespace('client::customers').should eq 'Client::Customer'
        subject.classify_namespace('namespace::dummy_model').should eq 'Namespace::DummyModel'
      end

    end


  end
end

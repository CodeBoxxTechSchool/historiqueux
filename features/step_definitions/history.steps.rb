Quand(/^j'ai une entité 'DummyModel' dans la base de donnée avec le id (\d+)$/) do |arg1|
  @dummy_model = Fabricate(:dummy_model, {:id => 1})
end

Quand(/^J'accède la page 'index' du gem$/) do
  visit '/historiqueux/dummy_model/1'
end

Et(/^J'accède la page 'new' du gem$/) do
  visit '/historiqueux/dummy_model/1/new'
end

Alors(/^la page d'affichage de la liste de l'historique des modifications pour DummyModel est affichée$/) do
  page.should have_content("Type d'élément")
  page.should have_content('Évènement')
  page.should have_content('Fait par')
  page.should have_content('Date')
  page.has_xpath?('//table')
end

Et(/^le lien "(.*?)" s'affiche$/) do |link_name|
  find_link(link_name).visible?
end

Et(/^je clique sur le lien "(.*?)"$/) do |link_name|
  click_link(link_name)
end

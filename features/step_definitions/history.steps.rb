Quand(/^j'ai une entité 'DummyModel' dans la base de donnée avec le id (\d+)$/) do |arg1|
  @dummy_model = Fabricate(:dummy_model, {:id => 1})
  sleep 10
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

Alors(/^la page de consultation du détail de l'évènement s'ouvre$/) do
  page.has_xpath?('//div[class="container"]')
  page.should have_content("Évènement")
  page.should have_content("Quand")
  page.should have_content("Fait par")
end

Quand(/^je clique sur la ligne "(.*?)" du tableau$/) do |arg1|
  page.find(:xpath, "//*[@id='row#{arg1}']").click
  sleep 5
end

Et(/^le modèle "(.*?)" avec le id "(.*?)" a comme données dans la table versions$/) do |arg1, arg2, table|

  datas = table.hashes()

  for data in datas
    id = data['id']
    item_type = data['item_type']
    item_id = data['item_id']
    event= data['event']
    whodunnit = data['whodunnit']
    object = data['object']
    created_at = data['created_at']
    object_changes = data['object_changes']
    Fabricate(:version, :id => id.to_i, :item_type => item_type, :item_id => item_id.to_i, :event => event,
              :whodunnit => whodunnit, :object => object, :created_at => created_at, :object_changes => object_changes)
    sleep 10
  end

end

Et(/^on a comme évènement "(.*?)"$/) do |arg1|
  page.find(:xpath, "//*[@id='event']").text.should eq "Évènement : #{arg1}"
end

Et(/^on a comme élément "(.*?)"$/) do |arg1|
  page.find(:xpath, "//*[@id='item_type']").text.should eq "Élément : #{arg1}"
end

Quand(/^je clique sur la section 'Valeurs de cette version'$/) do
  page.find(:xpath, '//a[@href="#collapseOne"]').click
  sleep 5
end

Quand(/^je clique sur la section 'Valeurs de la version précédente'$/) do
  page.find(:xpath, '//a[@href="#collapseTwo"]').click
  sleep 5
end

Quand(/^je clique sur la section 'Différence\(s\)'$/) do
  page.find(:xpath, '//a[@href="#collapseThree"]').click
  sleep 5
end

Et(/^la section "(.*?)" contient "(.*?)"$/) do |arg1, arg2|
  page.find(:xpath, "//*[@id='#{arg1}']").text.should include arg2
end

Et(/^une mise à jour est effectuée sur le "(.*?)" (\d+) pour mettre le champs "(.*?)" a "(.*?)"$/) do |klassName, arg1, arg2, arg3|
  klass = eval(klassName)
  model_to_update = klass.find(arg1)
  model_to_update.send("#{arg2}=", arg3)
  model_to_update.save!
end

Et(/^cette entité "(.*?)" de "(.*?)" a "(.*?)" entité liée de type "(.*?)" dans une relation "(.*?)"$/) do |parent_id, parent_type, child_number, child_type, relation_type|
  i = 0
  while i<child_number.to_i
    Fabricate(child_type.underscore, {:id => i+1, :dummy_model_id => @dummy_model.id})
    i = i + 1
  end
end

Alors(/^je vois le lien "(.*?)" dans la liste des relations affichées$/) do |arg1|
  page.find(:xpath, "//*[@id='relations_list']").text.should include arg1
end

Alors(/^je vois le lien "(.*?)" dans la liste des relations affichées pour la première entité de la liste$/) do |arg1|
  page.find(:xpath, "//*[@id='relations_list0']").text.should include arg1
end

Alors(/^la page d'index des relations s'ouvre pour "(.*?)"$/) do |arg1|
  page.should have_content("Liste des #{arg1} liés au dummy_model")
end

Alors(/^la page d'index des relations "(.*?)" s'ouvre pour "(.*?)"$/) do |arg1, arg2|
  page.should have_content("Liste des #{arg1} liés au #{arg2}")
end

Et(/^la page contient "(.*?)"$/) do |arg1|
  page.should have_content(arg1)
end
# language: fr

@javascript
Fonctionnalité: En tant qu'utilisateur,
  Je veux visualiser l'historique des modifications d'une ou des entités présentes dans une relation

  Scénario: : Affichage de la page de liste de l'historique des modifications des entités d'une relation
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et cette entité "1" de "DummyModel" a "1" entité liée de type "Horse" dans une relation "has_many"
    Et J'accède la page 'index' du gem
    Et je clique sur le lien "toggler_relations"
    Et je vois le lien "horses" dans la liste des relations affichées
    Et je clique sur le lien "horses_relation_link"
    Alors la page d'index des relations s'ouvre pour "horses"

  Scénario: Accès au détails d'un évènement create d'une relation
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et cette entité "1" de "DummyModel" a "1" entité liée de type "Horse" dans une relation "has_many"
    Et J'accède la page 'index' du gem
    Et je clique sur le lien "toggler_relations"
    Et je vois le lien "horses" dans la liste des relations affichées
    Et je clique sur le lien "horses_relation_link"
    Alors la page d'index des relations s'ouvre pour "horses"
    Quand je clique sur la ligne "1" du tableau
    Alors la page de consultation du détail de l'évènement s'ouvre
    Et on a comme évènement "create"
    Et on a comme élément "Horse"
    Quand je clique sur la section 'Valeurs de cette version'
    Alors la section "current_version_values" contient "["id", 1] ["name", nil] ["length", nil]"
    Et la section "current_version_values" contient "["dummy_model_id", 1]"
    Quand je clique sur la section 'Valeurs de la version précédente'
    Et la section "preceding_version_values" contient "Aucune valeur"
    Quand je clique sur la section 'Différence(s)'
    Et la section "differences" contient ""

  Scénario: Accès au détails d'un évènement update d'une relation
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et cette entité "1" de "DummyModel" a "1" entité liée de type "Horse" dans une relation "has_many"
    Et une mise à jour est effectuée sur le "Horse" 1 pour mettre le champs "name" a "Eclair"
    Et J'accède la page 'index' du gem
    Et je clique sur le lien "toggler_relations"
    Et je vois le lien "horses" dans la liste des relations affichées
    Et je clique sur le lien "horses_relation_link"
    Alors la page d'index des relations s'ouvre pour "horses"
    Quand je clique sur la ligne "2" du tableau
    Alors la page de consultation du détail de l'évènement s'ouvre
    Et on a comme évènement "update"
    Et on a comme élément "Horse"
    Quand je clique sur la section 'Valeurs de cette version'
    Alors la section "current_version_values" contient "["id", 1] ["name", "Eclair"] ["length", nil]"
    Et la section "current_version_values" contient "["dummy_model_id", 1]"
    Quand je clique sur la section 'Valeurs de la version précédente'
    Alors la section "preceding_version_values" contient "["id", 1] ["name", nil] ["length", nil]"
    Et la section "preceding_version_values" contient "["dummy_model_id", 1]"
    Quand je clique sur la section 'Différence(s)'
    Alors la section "differences" contient "["name", [nil, "Eclair"]]"


  Scénario: Cas d'une relation multiple contenant plusieurs entités
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et cette entité "1" de "DummyModel" a "2" entité liée de type "Horse" dans une relation "has_many"
    Et J'accède la page 'index' du gem
    Et je clique sur le lien "toggler_relations"
    Et je vois le lien "horses" dans la liste des relations affichées
    Et je clique sur le lien "horses_relation_link"
    Alors la page d'index des relations s'ouvre pour "horses"
    Et la page contient "Liste des horses liés au dummy_model no 1"
    Et la page contient "horses no 1"
    Et la page contient "horses no 2"


  Scénario: Cas d'une relation sur une entité non-historisée
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et cette entité "1" de "DummyModel" a "2" entité liée de type "Horse" dans une relation "has_many"
    Et cette entité "1" de "DummyModel" a "1" entité liée de type "Poney" dans une relation "has_one"
    Et J'accède la page 'index' du gem
    Et je clique sur le lien "toggler_relations"
    Et je vois le lien "horses" dans la liste des relations affichées
    Et je vois le lien "poney" dans la liste des relations affichées
    Et je clique sur le lien "poney_relation_link"
    Alors la page d'index des relations s'ouvre pour "poney"
    Et la page contient "Liste des poney liés au dummy_model no 1"
    Et la page contient "poney no 1"
    Et la page contient "ENTITÉ NON VERSIONNÉE"


  Scénario: Visualiser la liste de liens vers les relations d'une entité relation
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et cette entité "1" de "DummyModel" a "1" entité liée de type "Horse" dans une relation "has_many"
    Et J'accède la page 'index' du gem
    Et je clique sur le lien "toggler_relations"
    Alors je vois le lien "horses" dans la liste des relations affichées
    Et je clique sur le lien "horses_relation_link"
    Alors la page d'index des relations s'ouvre pour "horses"
    Et la page contient "Liste des horses liés au dummy_model no 1"
    Alors je clique sur le lien "toggler_relations0"
    Alors je vois le lien "dummy_model" dans la liste des relations affichées pour la première entité de la liste

  Scénario: Naviguer vers la page d'index des relations d'une relation
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et cette entité "1" de "DummyModel" a "1" entité liée de type "Horse" dans une relation "has_many"
    Et J'accède la page 'index' du gem
    Et je clique sur le lien "toggler_relations"
    Alors je vois le lien "horses" dans la liste des relations affichées
    Et je clique sur le lien "horses_relation_link"
    Alors la page d'index des relations s'ouvre pour "horses"
    Et la page contient "Liste des horses liés au dummy_model no 1"
    Alors je clique sur le lien "toggler_relations0"
    Alors je vois le lien "dummy_model" dans la liste des relations affichées pour la première entité de la liste
    Et je clique sur le lien "dummy_model_open_relation0"
    Alors la page d'index des relations "dummy_model" s'ouvre pour "horse"
    Et la page contient "Liste des dummy_model liés au horses no 1"
    Et la page contient "dummy_model no 1"



# language: fr

@javascript
Fonctionnalité: En tant qu'utilisateur,
  Je veux visualiser l'historique des modifications d'une entité

  Scénario: : Affichage de la page de liste de l'historique des modifications
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et J'accède la page 'index' du gem
    Alors la page d'affichage de la liste de l'historique des modifications pour DummyModel est affichée

  Scénario: Accès au détails d'un évènement
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et J'accède la page 'index' du gem
    Quand je clique sur la ligne "1" du tableau
    Alors la page de consultation du détail de l'évènement s'ouvre


  Scénario: Accès au détails d'un évènement create
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et J'accède la page 'index' du gem
    Quand je clique sur la ligne "1" du tableau
    Alors la page de consultation du détail de l'évènement s'ouvre
    Et on a comme évènement "create"
    Et on a comme élément "DummyModel"
    Quand je clique sur la section 'Valeurs de cette version'
    Alors la section "current_version_values" contient "["id", 1] ["field1", "blah"] ["field2", "blah2"] ["field3", "blah3"]"
    Et la section "preceding_version_values" contient "Aucune valeur"
    Et la section "differences" contient ""


  Scénario: Accès au détails d'un évènement create lorsque des updates ont suivi
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et une mise à jour est effectuée sur le 'DummyModel' 1 pour mettre le champs "field1" a "galette"
    Et J'accède la page 'index' du gem
    Quand je clique sur la ligne "1" du tableau
    Alors la page de consultation du détail de l'évènement s'ouvre
    Et on a comme évènement "create"
    Et on a comme élément "DummyModel"
    Quand je clique sur la section 'Valeurs de cette version'
    Alors la section "current_version_values" contient "["id", 1] ["field1", "blah"] ["field2", "blah2"] ["field3", "blah3"]"
    Et la section "preceding_version_values" contient "Aucune valeur"
    Et la section "differences" contient ""


  Scénario: Accès au détails d'un évènement update
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et une mise à jour est effectuée sur le 'DummyModel' 1 pour mettre le champs "field1" a "galette"
    Et J'accède la page 'index' du gem
    Quand je clique sur la ligne "2" du tableau
    Alors la page de consultation du détail de l'évènement s'ouvre
    Et on a comme évènement "update"
    Et on a comme élément "DummyModel"
    Quand je clique sur la section 'Valeurs de cette version'
    Alors la section "current_version_values" contient "["id", 1] ["field1", "galette"] ["field2", "blah2"] ["field3", "blah3"]"
    Quand je clique sur la section 'Valeurs de la version précédente'
    Alors la section "preceding_version_values" contient "["id", 1] ["field1", "blah"] ["field2", "blah2"] ["field3", "blah3"]"
    Quand je clique sur la section 'Différence(s)'
    Alors la section "differences" contient "["field1", ["blah", "galette"]]"

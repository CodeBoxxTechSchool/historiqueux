# language: fr

Fonctionnalité: En tant qu'utilisateur,
  Je veux visualiser l'historique des modifications d'une entité

  Scénario: : Affichage de la page de liste de l'historique des modifications
    Quand j'ai une entité 'DummyModel' dans la base de donnée avec le id 1
    Et J'accède la page 'index' du gem
    Alors la page d'affichage de la liste de l'historique des modifications pour DummyModel est affichée

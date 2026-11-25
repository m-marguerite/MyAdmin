User.create!(email: "bob@gmail.com", password: "azerty")

Procedure.create!(name: "Declaration d'impots", user: User.last)

 Checklist.create!(name: "Déclaration d'impots", description: "Compléter ma declaration d'impots avec mes nouveaux revenues de développeuse web", procedure_id: Procedure.last.id)

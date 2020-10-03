@api @javascript

Feature: Checkout flow errors


Background:

    Given I am logged in as a user with the "authenticated" role
    When I am on the homepage
    Then I am on "/fr/home"


Scenario: Submit Number serie form with not valid values


    #Step 1

    And I fill in "Numéro de série" with "1234567890123455678"
    And I wait 3 seconds
    Then I should see the text "Machine non reconnue"
    And I fill in "Numéro de série" with "111111111111111101"
    And I wait 3 seconds
    And I press the "Commander" button
    Then I should see the text "Le numéro de série doit comporter 19 caractères"
    And I fill in "Numéro de série" with "2222222222222222220"
    And I wait 3 seconds
    And I press the "Commander" button
    Then I should see the text "Ce numéro de série a déjà été utilisé et est déjà présent dans la base de donnée."



Scenario: Submit the Details form adding wrong values format and empty fields

    #Step 1

    And I fill in "Numéro de série" with "2222222222222222224"
    And I wait 3 seconds
    And I press the "Commander" button


    #Step 2

    #And I fill in "Prix de vente" with "100"
    #And I press the "Suivant" button


    #Step 3


    And I fill in "Prénom" with "John"
    And I fill in "Nom" with "Smith"
    And I fill in "Adresse" with "32 Rue Guy Môquet"
    And I fill in "Code postal" with "1"
    And I fill in "Ville" with "Malakoff"
    And I fill in "Email du client (si client Nespresso = email du compte Nespresso)" with "nes-trade/mgmt@skilld.cloud"
    And I fill in "Prénom et NOM du porteur du RIB" with "John Doe"
    And I fill in "IBAN (Si le client a déjà un ABO Nespresso prélevé sur IBAN, alors le dernier IBAN saisi sera celui utilisé pour tous les ABO.)" with "Test1234"
    And I fill in "En cochant cette case, vous devez indiquer à votre client qu’il accepte les conditions générales de vente de l’abonnement Nespresso avec un engagement d’1 an minimum." with "1"
    And I fill in "En cochant cette case, vous devez indiquer à votre client qu’il accepte les conditions particulières de l‘abonnement." with "1"
    And I press the "Commander avec obligation de paiement" button
    Then I should see the text "Le champ Dans quelle langue souhaitez-vous être contacté dans le futur ? est requis."
    Then I should see the text "Le champ Civilité est requis."
    Then I should see the text "Phone number in Numéro de portable (pour signature électronique par SMS) is required."
    Then I should see the text "L'IBAN doit commencer par 2 lettres et être suivie de plusieurs chiffres"
    Then I should see the text "Code postal field is not in the right format."
    And I fill in "Phone number" with "123"
    And I press the "Commander avec obligation de paiement" button
    Then I should see the text "Le numéro de téléphone utilisé 123 pour Numéro de portable (pour signature électronique par SMS) n'est pas un numéro de téléphone valide pour la Belgique."



Scenario: Submit the payment form with empty value

 
    #Step 1

    And I fill in "Numéro de série" with "2222222222222222224"
    And I wait 3 seconds
    And I press the "Commander" button
    And I take a screenshot

    #Step 2

    #And I fill in "Prix de vente" with "100"
    #And I press the "Suivant" button


    #Step 3

    And I select "French" from "Dans quelle langue souhaitez-vous être contacté dans le futur ?"
    And I fill in "Est-ce que votre client possède un N° de client Nespresso. Si oui, merci de l’indiquer ici" with "123"
    And I select "Mr" from "Civilité"
    And I fill in "Prénom" with "John"
    And I fill in "Nom" with "Smith"
    And I fill in "Adresse" with "32 Rue Guy Môquet"
    And I fill in "Code postal" with "1234"
    And I fill in "Ville" with "Malakoff"
    And I fill in "Phone number" with "0475922719"
    And I fill in "Email du client (si client Nespresso = email du compte Nespresso)" with "nes-trade/mgmt@skilld.cloud"
    And I fill in "Prénom et NOM du porteur du RIB" with "John Doe"
    And I fill in "IBAN (Si le client a déjà un ABO Nespresso prélevé sur IBAN, alors le dernier IBAN saisi sera celui utilisé pour tous les ABO.)" with "BE30000613332111"
    And I fill in "En cochant cette case, vous devez indiquer à votre client qu’il accepte les conditions générales de vente de l’abonnement Nespresso avec un engagement d’1 an minimum." with "1"
    And I fill in "En cochant cette case, vous devez indiquer à votre client qu’il accepte les conditions particulières de l‘abonnement." with "1"
    And I press the "Commander avec obligation de paiement" button
    And I wait 5 seconds


    #Step 4

    Given I switch to iframe "slimpay-gateway"
    And I press the "Envoyer" button
    And I wait 5 seconds
    Then I should see the text "Renseignez le code (recevoir le code peut prendre jusqu'à 2 minutes en fonction des opérateurs)."
    And I take a screenshot


Scenario: Submit the confirmation form with wrong value format


    #Step 1

    And I fill in "Numéro de série" with "2222222222222222225"
    And I wait 3 seconds
    And I press the "Commander" button
    And I take a screenshot

    #Step 2

    #And I fill in "Prix de vente" with "100"
    #And I press the "Suivant" button


    #Step 3

    And I select "French" from "Dans quelle langue souhaitez-vous être contacté dans le futur ?"
    And I fill in "Est-ce que votre client possède un N° de client Nespresso. Si oui, merci de l’indiquer ici" with "123"
    And I select "Mr" from "Civilité"
    And I fill in "Prénom" with "John"
    And I fill in "Nom" with "Smith"
    And I fill in "Adresse" with "32 Rue Guy Môquet"
    And I fill in "Code postal" with "1234"
    And I fill in "Ville" with "Malakoff"
    And I fill in "Phone number" with "0475922719"
    And I fill in "Email du client (si client Nespresso = email du compte Nespresso)" with "nes-trade/mgmt@skilld.cloud"
    And I fill in "Prénom et NOM du porteur du RIB" with "John Doe"
    And I fill in "IBAN (Si le client a déjà un ABO Nespresso prélevé sur IBAN, alors le dernier IBAN saisi sera celui utilisé pour tous les ABO.)" with "BE30000613332111"
    And I fill in "En cochant cette case, vous devez indiquer à votre client qu’il accepte les conditions générales de vente de l’abonnement Nespresso avec un engagement d’1 an minimum." with "1"
    And I fill in "En cochant cette case, vous devez indiquer à votre client qu’il accepte les conditions particulières de l‘abonnement." with "1"
    And I press the "Commander avec obligation de paiement" button
    And I wait 5 seconds

    #Step 4

    Given I switch to iframe "slimpay-gateway"
    And I fill in "otp" with "test"
    And I press the "Envoyer" button
    And I wait 5 seconds
    Then I should see the text "Renseignez un code valide (recevoir le code peut prendre jusqu'à 2 minutes en fonction des opérateurs)."
    And I take a screenshot




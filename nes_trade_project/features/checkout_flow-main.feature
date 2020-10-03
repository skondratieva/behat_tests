@api @javascript


Feature: Checkout flow success

Background:

    #Step 1

    Given I am an anonymous user
    When I visit "/fr"
    And I fill in "Nom d'utilisateur" with "seller-test"
    And I fill in "Mot de passe" with "123456789Aa!"
    And I press the "Se connecter" button


Scenario: Completion of order

    #Step 2

    And I fill in "Numéro de série" with "2222222222222222220"
    And I wait 3 seconds
    And I press the "Commander" button
    And I take a screenshot

    #Step 3

    #And I fill in "Prix de vente" with "100"
    #And I press the "Suivant" button


    #Step 4

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

    #Step 5

    Given I switch to iframe "slimpay-gateway"
    Then I should see the text "Renseignez le code reçu par SMS"
    And I click the "p.demo-tooltip.demo-otp a" element
    And I press the "Envoyer" button
    And I wait 5 seconds


    #Step 6
    Given I switch back to main window
    Then I should see the text "Merci, nous confirmons"
    And I take a screenshot
    
    
Scenario: Cancel of order

    #Step 2

    And I fill in "Numéro de série" with "2222222222222222221"
    And I wait 3 seconds
    And I press the "Commander" button
    And I take a screenshot

    #Step 3

    #And I fill in "Prix de vente" with "100"
    #And I press the "Suivant" button


    #Step 4

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

    #Step 5

    Given I switch to iframe "slimpay-gateway"
    Then I should see the text "Renseignez le code reçu par SMS"
    And I click "Annuler"
    And I wait 5 seconds
    Then I should see the text "La transaction de paiement Slimpay a été annulée."
    And I take a screenshot



Scenario: Fail of order

    #Step 2

    And I fill in "Numéro de série" with "2222222222222222223"
    And I wait 3 seconds
    And I press the "Commander" button
    And I take a screenshot

    #Step 3

    #And I fill in "Prix de vente" with "100"
    #And I press the "Suivant" button


    #Step 4

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

    #Step 5

    Given I switch to iframe "slimpay-gateway"
    Then I should see the text "Renseignez le code reçu par SMS"
    And I fill in "otp" with "0000"
    And I press the "Envoyer" button
    And I wait 5 seconds
    Then I should see the text "Renseignez un code valide (recevoir le code peut prendre jusqu'à 2 minutes en fonction des opérateurs)."
    And I fill in "otp" with "0000"
    And I press the "Envoyer" button
    And I wait 5 seconds
    And I fill in "otp" with "0000"
    And I press the "Envoyer" button
    And I wait 5 seconds
    And I fill in "otp" with "0000"
    And I press the "Envoyer" button
    And I wait 5 seconds
    Then I should see the text "Une erreur s'est produite au cours de la transaction de paiement Slimpay."
    And I take a screenshot


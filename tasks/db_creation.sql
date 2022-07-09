/*
Adatbázis létrehozása feladat

Készíts adatbázis-táblákat a feladat leírása alapján!
(Magát az adatbázist nem kell létrehoznod.)

Amit be kell adnod:
    - a táblák létrehozásának MySQL utasítása
    - a táblák mezőinek létrehozásához és beállításához szükséges MySQL utasítások

Az utasításokat jelen fájl tartalmazza!

A bónusz feladat megoldása nem kötelező.

Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
A feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatnál csak a teljesen helyes megoldásért jár pont.

A feladat leírása törölhető.

Jó munkát!
*/

/*
Adatbázis-táblák létrehozása (20 pont)

Az általad létrehozott adatbázist egy üzenetküldő alkalmazáshoz szeretnénk használni.
Az alkalmazásban a felhasználók regisztrálás után tudnak üzenetet küldeni szintén regisztrált felhasználóknak,
valamint a kapott üzenetekre válaszolhatnak.
Nincs lehetőség több címzett megadására - azaz egy üzenetet csak egy felhasználó részére lehet küldeni.

Az adatbázisnak képesnek kell lennie a következő adatok tárolására:
    1. regisztrált felhasználók adatai
        - kötelező adatok: név, email-cím, jelszó, aktív felhasználó-e, a regisztrálás időpontja
    2. a regisztrált felhasználók által egymásnak küldött üzenetek adatai
        - kötelező adatok: küldő, címzett, üzenet szövege, az üzenet küldésének időpontja,
          továbbá ha az üzenet egy korábban kapottra válasz, akkor hivatkozás a megválaszolt üzenetre

Kritériumok az adatbázissal kapcsolatban:
    - legalább kettő, legfeljebb négy táblát tartalmazzon
    - legyen legalább egy kapcsolat a létrehozott táblák között (idegen kulccsal)
      (egy tábla saját magával is kapcsolódhat)
    - a fent leírt adatokon kívül más adatokat is tárolhat, de egy táblán legfeljebb 8 mező lehet
    - az adatbázis, a táblák és a mezők elnevezése rajtad áll, azonban használj angol megnevezéseket, méghozzá következetesen
      (ha az egyik táblában camel-case szerinti mező-neveket adtál, akkor a másik táblában is tégy úgy)

*/

    1.

    CREATE TABLE `sqltest`.`user` (`id` INT NOT NULL AUTO_INCREMENT , `name` VARCHAR(100) NOT NULL , `email_address` VARCHAR(100) NOT NULL , `password` VARCHAR(100) NOT NULL , `is_active` BOOLEAN NOT NULL , `date_of_registration` DATE NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;



    2.

    CREATE TABLE `sqltest`.`messages` (`message_id` INT NOT NULL AUTO_INCREMENT , `sender_id` INT NOT NULL , `recipient_id` INT NOT NULL , `message` VARCHAR(100) NOT NULL , `date_sent` DATE NOT NULL , `reply_id` INT NOT NULL , PRIMARY KEY (`message_id`)) ENGINE = InnoDB;



    3. (Creating a relation - Foreign Key)

    ALTER TABLE `messages` ADD FOREIGN KEY (`sender_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `messages` ADD FOREIGN KEY (`recipient_id`) REFERENCES `user`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT; ALTER TABLE `messages` ADD FOREIGN KEY (`reply_id`) REFERENCES `messages`(`message_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

    ALTER TABLE `messages` CHANGE `reply_id` `reply_id` INT(11) NULL;
-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladat (5 pont)

Adj hozzá adatokat mindegyik táblához!
(Az adatoknak nem kell valósnak lenniük. Egy felhasználói email-cím lehet például: 'valami@valami.va')

*/


    1.

    INSERT INTO `user` (`id`, `name`, `email_address`, `password`, `is_active`, `date_of_registration`) VALUES (NULL, 'Claire', 'claire@clairemail.com', 'Iamclaire', '1', '2022-07-01'), (NULL, 'Chloe', 'chloe@chloemail.com', 'Iamchloe', '1', '2022-07-02'), (NULL, 'Catherine', 'catherine@catherinemail.com', 'Iamcatherine', '1', '2022-07-07');


    2.

    INSERT INTO `messages` (`message_id`, `sender_id`, `recipient_id`, `message`, `date_sent`, `reply_id`) VALUES (NULL, '2', '1', 'Hey Claire,\r\nIt\'s Chloe!', '2022-07-07', NULL), (NULL, '3', '2', 'Who are you?', '2022-07-07', NULL);

    INSERT INTO `messages` (`message_id`, `sender_id`, `recipient_id`, `message`, `date_sent`, `reply_id`) VALUES (NULL, '1', '2', 'OK', '2022-07-08', '1');



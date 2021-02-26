DROP USER IF EXISTS'sqlix_u'@'localhost';

CREATE USER 'sqlix_u'@'localhost'
IDENTIFIED BY 'totosqlix';

GRANT SELECT,INSERT,UPDATE,DELETE ON sqlix.* to 'sqlix_u'@'localhost';
FLUSH PRIVILEGES; 
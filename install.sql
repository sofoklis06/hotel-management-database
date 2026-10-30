DROP DATABASE IF EXISTS hotel_big_db;

-- Δημιουργεί τη νέα βάση δεδομένων 
-- Το 'CHARACTER SET utf8mb4' και το 'COLLATE utf8mb4_unicode_ci' εξασφαλίζουν την πλήρη υποστήριξη Ελληνικών και συμβόλων
CREATE DATABASE hotel_big_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Λέει στη MySQL να "μπει" μέσα σε αυτή τη βάση για να εκτελέσει τις επόμενες εντολές
USE hotel_big_db;

-- Δημιουργεί τον πίνακα sex
CREATE TABLE sex (
    -- id_sex: INT, PRIMARY KEY, AUTO_INCREMENT
    id_sex INT PRIMARY KEY AUTO_INCREMENT,
    
    title VARCHAR(30) NOT NULL
) ENGINE=InnoDB; 

-- Δημιουργεί τον πίνακα 'room_type' 
CREATE TABLE room_type (
    id_type INT PRIMARY KEY AUTO_INCREMENT, 
    title VARCHAR(50) NOT NULL,             
    price_per_night DECIMAL(10,2) NOT NULL  
) ENGINE=InnoDB;

-- Δημιουργεί τον πίνακα staff
CREATE TABLE staff (
    id_staff INT PRIMARY KEY AUTO_INCREMENT, 
    fname VARCHAR(100) NOT NULL,             
    lname VARCHAR(100) NOT NULL,             
    role VARCHAR(50) NOT NULL,               
    salary DECIMAL(10,2) NOT NULL            
) ENGINE=InnoDB;

-- Δημιουργεί τον πίνακα guest
CREATE TABLE guest (
    id_guest INT PRIMARY KEY AUTO_INCREMENT, 
    fname VARCHAR(255) NOT NULL,             
    lname VARCHAR(255) NOT NULL,             
    email VARCHAR(255) UNIQUE NOT NULL,      
    phone VARCHAR(20) DEFAULT NULL,          
    id_sex INT DEFAULT NULL,                 
    -- Δημιουργεί Foreign Key. Ενώνει το id_sex του πελάτη με το id_sex του πίνακα sex
    -- ON DELETE SET NULL: Αν διαγραφεί ένα φύλο, στους πελάτες το id_sex θα γίνει NULL
    -- ON UPDATE CASCADE: Αν αλλάξει το id_sex στον πίνακα sex, θα αλλάξει αυτόματα και εδώ
    CONSTRAINT fk_guest_sex FOREIGN KEY (id_sex) REFERENCES sex(id_sex) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Δημιουργεί τον πίνακα room
CREATE TABLE room (
    id_room VARCHAR(10) PRIMARY KEY,         
    id_type INT NOT NULL,                    
    floor INT NOT NULL,                      
    -- Ξένο κλειδί που ενώνει το δωμάτιο με τον τύπο του. ON DELETE RESTRICT: Απαγορεύει τη διαγραφή ενός τύπου δωματίου αν υπάρχουν δωμάτια σε αυτόν τον τύπο
    CONSTRAINT fk_room_type FOREIGN KEY (id_type) REFERENCES room_type(id_type) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Δημιουργεί τον πίνακα service
CREATE TABLE service (
    id_service INT PRIMARY KEY AUTO_INCREMENT, 
    service_title VARCHAR(100) NOT NULL,       
    price DECIMAL(10,2) NOT NULL               
) ENGINE=InnoDB;

-- Δημιουργεί τον πίνακα booking
CREATE TABLE booking (
    id_booking INT PRIMARY KEY AUTO_INCREMENT, 
    id_guest INT NOT NULL,                     
    id_room VARCHAR(10) NOT NULL,              
    id_staff INT DEFAULT NULL,                
    check_in DATE NOT NULL,                    
    check_out DATE NOT NULL,                   
    room_cost DECIMAL(10,2) NOT NULL,          
    dt_inserted DATETIME DEFAULT CURRENT_TIMESTAMP, -- Καταγράφει αυτόματα την τρέχουσα ημερομηνία και ώρα της στιγμής που δημιουργείται η κράτηση
    -- Ξένο κλειδί προς τον πίνακα guest. ON DELETE CASCADE: Αν διαγραφεί ο πελάτης, διαγράφονται αυτόματα και οι κρατήσεις του
    CONSTRAINT fk_booking_guest FOREIGN KEY (id_guest) REFERENCES guest(id_guest) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Ξένο κλειδί προς τον πίνακα room. ON DELETE CASCADE: Αν διαγραφεί το δωμάτιο, διαγράφονται αυτόματα και οι κρατήσεις του
    CONSTRAINT fk_booking_room FOREIGN KEY (id_room) REFERENCES room(id_room) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Ξένο κλειδί προς τον πίνακα staff. ON DELETE SET NULL: Αν διαγραφεί ο υπάλληλος, το πεδίο μένει NULL 
    CONSTRAINT fk_booking_staff FOREIGN KEY (id_staff) REFERENCES staff(id_staff) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Δημιουργεί τον πίνακα booking_service
CREATE TABLE booking_service (
    id INT PRIMARY KEY AUTO_INCREMENT,        
    id_booking INT NOT NULL,                    
    id_service INT NOT NULL,                   
    quantity INT NOT NULL DEFAULT 1,           
    service_price DECIMAL(10,2) NOT NULL,      
    dt_inserted DATETIME DEFAULT CURRENT_TIMESTAMP, 
    -- Ξένο κλειδί προς την κράτηση. Αν διαγραφεί η κράτηση, σβήνονται και οι υπηρεσίες της 
    CONSTRAINT fk_bs_booking FOREIGN KEY (id_booking) REFERENCES booking(id_booking) ON DELETE CASCADE ON UPDATE CASCADE,
    -- Ξένο κλειδί προς τις υπηρεσίες. Δεν μπορούμε να σβήσουμε μια υπηρεσία από τον κατάλογο, αν έχει ήδη πουληθεί σε κράτηση 
    CONSTRAINT fk_bs_service FOREIGN KEY (id_service) REFERENCES service(id_service) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

-- Δημιουργεί τον πίνακα payment
CREATE TABLE payment (
    id_payment INT PRIMARY KEY AUTO_INCREMENT, 
    id_booking INT NOT NULL,                   
    payment_method VARCHAR(50) NOT NULL,       
    amount DECIMAL(10,2) NOT NULL,             
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP, 
    -- Ξένο κλειδί προς την κράτηση CASCADE
    CONSTRAINT fk_payment_booking FOREIGN KEY (id_booking) REFERENCES booking(id_booking) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;


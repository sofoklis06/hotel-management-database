-- Εισάγει 3 εγγραφές στον πίνακα sex. Δεν βάζουμε το ID γιατί μπαίνει αυτόματα 
INSERT INTO sex (title) VALUES ('Male'), ('Female'), ('Other');

-- Εισάγει 3 τύπους δωματίων και τις τιμές τους
INSERT INTO room_type (title, price_per_night) VALUES 
('Standard Single', 50.00), ('Deluxe Double', 90.00), ('Executive Suite', 160.00);

-- Εισάγει 3 υπαλλήλους με τα στοιχεία τους
INSERT INTO staff (fname, lname, role, salary) VALUES 
('Γιάννης', 'Παπαδόπουλος', 'Reception', 1100.00),
('Αλέξανδρος', 'Ζήσης', 'Reception', 1150.00),
('Ελένη', 'Δημητρίου', 'Housekeeping', 950.00);

-- Εισάγει 5 δωμάτια. Ορίζουμε το id_room χειροκίνητα γιατί δεν είναι AUTO_INCREMENT
INSERT INTO room (id_room, id_type, floor) VALUES 
('101', 1, 1), ('102', 1, 1), ('201', 2, 2), ('202', 2, 2), ('301', 3, 3);

-- Εισάγει 5 πελάτες με τα στοιχεία τους. Ο αριθμός στο τέλος είναι το id_sex
INSERT INTO guest (fname, lname, email, phone, id_sex) VALUES 
('Σταύρος', 'Χριστοδούλου', 'stavros@mail.com', '6937694820', 1),
('Βασιλική', 'Αναγνωστοπούλου', 'vasiliki@mail.com', '6958572441', 2),
('Χρήστος', 'Βλάχος', 'vlahos@mail.com', '6987060989', 1),
('Γλυκερία', 'Κωνσταντινίδη', 'glykeria@mail.com', '6974446818', 2),
('Μαρία', 'Καραγιάννη', 'maria@mail.com', '6991269934', 2);

-- Εισάγει 5 κρατήσεις. Δίνουμε id_guest, id_room, id_staff, ημερομηνίες και κόστος
INSERT INTO booking (id_guest, id_room, id_staff, check_in, check_out, room_cost) VALUES 
(1, '101', 1, '2025-05-10', '2025-05-15', 250.00),
(2, '201', 1, '2025-06-01', '2025-06-04', 270.00),
(3, '301', 2, '2025-08-15', '2025-08-20', 800.00),
(1, '202', 2, '2026-01-03', '2026-01-05', 180.00),
(4, '102', 1, '2025-09-10', '2025-09-12', 100.00);

-- Εισάγει 3 διαθέσιμες υπηρεσίες καταλόγου
INSERT INTO service (service_title, price) VALUES 
('Spa Session', 40.00), ('Room Service Breakfast', 15.00), ('Airport Shuttle', 30.00);

-- Χρεώνει 4 υπηρεσίες μέσα στις κρατήσεις που έγιναν παραπάνω
INSERT INTO booking_service (id_booking, id_service, quantity, service_price) VALUES 
(1, 2, 2, 15.00), (2, 1, 1, 40.00), (3, 1, 2, 40.00), (3, 3, 1, 30.00);

-- Καταχωρεί 3 πληρωμές για τις αντίστοιχες κρατήσεις
INSERT INTO payment (id_booking, payment_method, amount, payment_date) VALUES 
(1, 'Card', 280.00, '2025-05-15'), (2, 'Cash', 310.00, '2025-06-04'), (3, 'Card', 1180.00, '2025-08-20');


-- Ερώτημα 1: Να βρεθούν όλα τα δωμάτια που είναι διαθέσιμα το Πάσχα (17/04/2025 - 22/04/2025)
SELECT r.id_room, rt.title AS room_type, r.floor 
FROM room r 
JOIN room_type rt ON r.id_type = rt.id_type 
WHERE r.id_room NOT IN ( 
    SELECT id_room 
    FROM booking 
    WHERE check_in < '2025-04-22' AND check_out > '2025-04-17' 
);



-- Ερώτημα 2: Πόσα χρήματα ξόδεψε κάθε επισκέπτης συνολικά;
SELECT g.id_guest, g.fname, g.lname, SUM(p.amount) AS total_spent 
FROM guest g 
JOIN booking b ON g.id_guest = b.id_guest 
JOIN payment p ON b.id_booking = p.id_booking 
GROUP BY g.id_guest, g.fname, g.lname; 



-- Ερώτημα 3: Να βρεθούν οι 3 πελάτες που ξόδεψαν τα περισσότερα χρήματα μέσα στο 2025
SELECT g.id_guest, g.fname, g.lname, SUM(p.amount) AS total_spent_2025 
FROM guest g
JOIN booking b ON g.id_guest = b.id_guest
JOIN payment p ON b.id_booking = p.id_booking
WHERE YEAR(p.payment_date) = 2025 
GROUP BY g.id_guest, g.fname, g.lname 
ORDER BY total_spent_2025 DESC 
LIMIT 3; 



-- Ερώτημα 4: Ποιες υπηρεσίες χρησιμοποιούνται πιο συχνά;
SELECT s.service_title, COUNT(bs.id) AS times_purchased 
FROM service s 
JOIN booking_service bs ON s.id_service = bs.id_service 
GROUP BY s.id_service, s.service_title 
ORDER BY times_purchased DESC; 



-- Ερώτημα 5: Μέση διάρκεια διαμονής σε ημέρες
SELECT AVG(DATEDIFF(check_out, check_in)) AS avg_stay_duration_days 
FROM booking; -- Στον πίνακα των κρατήσεων.


-- Ερώτημα 6: Να βρεθούν οι 5 πελάτες με τις περισσότερες διαμονές
SELECT g.id_guest, g.fname, g.lname, COUNT(b.id_booking) AS total_stays 
FROM guest g
JOIN booking b ON g.id_guest = b.id_guest 
GROUP BY g.id_guest, g.fname, g.lname 
ORDER BY total_stays DESC 
LIMIT 5; 



-- Ερώτημα 7: Ποιοι τύποι δωματίων έχουν φέρει έσοδα άνω των 400 ευρώ;
SELECT rt.title AS room_type, SUM(b.room_cost) AS total_revenue 
FROM room_type rt
JOIN room r ON rt.id_type = r.id_type 
JOIN booking b ON r.id_room = b.id_room 
GROUP BY rt.title 
HAVING total_revenue > 400;



-- Ερώτημα 8: Πόσες κρατήσεις εξυπηρέτησε ο κάθε υπάλληλος της Reception;
SELECT s.fname, s.lname, COUNT(b.id_booking) AS handled_bookings 
FROM staff s
JOIN booking b ON s.id_staff = b.id_staff 
GROUP BY s.id_staff, s.fname, s.lname 
ORDER BY handled_bookings DESC; 


-- Ερώτημα 9: Ποιοι πελάτες έχουν κάνει κράτηση σε Deluxe Double δωμάτιο;
SELECT fname, lname 
FROM guest 
WHERE id_guest IN ( 
    SELECT b.id_guest 
    FROM booking b 
    JOIN room r ON b.id_room = r.id_room 
    JOIN room_type rt ON r.id_type = rt.id_type 
    WHERE rt.title = 'Deluxe Double' 
);



-- Ερώτημα 10: Ποια είναι τα συνολικά έσοδα από κάθε προσφερόμενη υπηρεσία;
SELECT s.service_title, SUM(bs.quantity * bs.service_price) AS total_service_revenue 
FROM service s
JOIN booking_service bs ON s.id_service = bs.id_service 
GROUP BY s.id_service, s.service_title 
ORDER BY total_service_revenue DESC; 


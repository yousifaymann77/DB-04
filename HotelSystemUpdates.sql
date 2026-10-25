use HotelReservationDB

----Insert operation----
insert into Guests (FullName , PassportNumber , Nationality , DateOfBirth)
values ('Yousif Ayman Shehab','202204789' , 'Egyptian' , '2004-12-17') ,
('Ahmed Samy Allam' , '202456784' , 'Italian' , '1998-02-18'),
('Ali Ahmed Mosa' , '202367546' , 'Egyptian','1999-12-10')


----Update operations----
update Rooms
set Dailyrate += (Dailyrate*0.15)


update Reservations
set ReservationStatus = case 
						when CheckoutDate < GETDATE() then 'Completed'
						when CheckoutDate > GETDATE() then 'Upcoming'
						else 'Active'
						end


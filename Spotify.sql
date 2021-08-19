create database Spotify
use Spotify
----------creating a User Table-------------
create table Spotify_Table
(
  Id int identity(1,1) primary key,
  FirstName varchar(200),
  LastName varchar(200),
  Age int,
  Country varchar(100),
  PhoneNumber bigint,
  Email varchar(200)
)
select * from Spotify_Table;
-----------Inserting Values-------------------
insert into Spotify_Table values
('Chandler','Bing',32,'US',976512366,'chan@gmail.com'),
('Monica','Geller',30,'India',11234567,'mon@gmail.com'),
('Damon','Salvatore',23,'US',747653272,'dam@gmail.com'),
('Joey','Tribiani',24,'India',57887482,'joey@gmail.com'),
('Rachel','Green',27,'India',7657887482,'rach@gmail.com')
-----------Retrieve details based on FirstName------------
select *from Spotify_Table Where FirstName='Monica'
-----------Update Age based on FirstName------------
update Spotify_Table set Age=28 Where FirstName='Chandler'
select * from Spotify_Table;
------------------creating Playlist table--------------
create table Playlist_Table
(
 Id int ,
 Playlist_Id int identity (1,1) primary key,
 Playlist_Name varchar(50),
 Description varchar(300),
 Is_public BIT
 foreign key (Id) references Spotify_Table(Id),
)
select * from Playlist_Table;
-------------------Inserting values into the Playlist Table------------------
insert into Playlist_Table values 
(1,'My Songs','Trending Songs',1),
(2,'My favourite','Yuvan Songs',1),
(3,'My Playlist','Trending Songs',0),
(4,'My Wishlist','Udit Songs',0),
(5,'My favourite','Yuvan Songs',1)

----------Sort the Names by Country ----------------
select FirstName,LastName,Age,Country,PhoneNumber,Email,Playlist_Name,Description,Is_public
from Spotify_Table 
INNER JOIN Playlist_Table on Spotify_Table.Id= Playlist_Table.Id
Where Country='India' order By(FirstName)

select FirstName,Playlist_Id,Playlist_Name
from Spotify_Table 
LEFT JOIN Playlist_Table on Spotify_Table.Id= Playlist_Table.Id
order By Spotify_Table.FirstName

select Playlist_Name,FirstName,LastName
from Playlist_Table 
RIGHT JOIN Spotify_Table on Playlist_Table.Id= Spotify_Table.Id
order By Playlist_Table.Playlist_Name

SELECT FirstName,LastName,Playlist_Name
FROM Spotify_Table
CROSS JOIN Playlist_Table;

----------------------Creating Tracks---------------------------------
create table Tracks
(
  Id int ,
  Playlist_Id int,
  Track_id int,
  Track_Name varchar(200)
  foreign key (Id) references Spotify_Table(Id),
  foreign key (Playlist_Id) references Playlist_Table(Playlist_Id)
)
-----------------Inserting Values into the tracks-----------------------
insert into Tracks values
(1,1,1,'Stairway To Heaven'),
(2,2,2,'Ferocious Soul'),
(3,2,3,'Empty Spaces'),
(4,3,1,'Stairway To Heaven'),
(5,3,4,'English Rose')
select * from Tracks

select *from tracks where  Track_Name='Stairway To Heaven'

select FirstName,LastName,Age,Country,PhoneNumber,Email,Playlist_Name,Description,Is_public,Track_Name 
from Spotify_Table
Full JOIN Playlist_Table on Spotify_Table.ID=Playlist_Table.ID 
Full JOIN Tracks on Spotify_Table.ID=Tracks.ID where FirstName='Monica'

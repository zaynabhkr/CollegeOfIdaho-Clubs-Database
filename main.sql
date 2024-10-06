.open ClubDatabase.db

.schema

/*CREATE TABLE Events (
  EventID INTEGER,
  MoneyAlloted NUMERIC Check (MoneyAlloted >= 0),
  EventDescription TEXT,
  StartDate DATE Check ((StartDate like '____-__-__') and (StartDate <= EndDate)),
  EndDate DATE Check ((EndDate like '____-__-__') and (StartDate <= EndDate)),
  EventName TEXT NOT NULL,
  EventLocation TEXT,
  PRIMARY KEY (EventID)
);
INSERT INTO Events(EventID,MoneyAlloted,EventDescription,StartDate,EndDate,EventName,EventLocation) VALUES 
  (1001, 100,'LeetCode practice with other computer science enthusiasts','2023-02-01','2023-05-06','Coding nights','Library'),
  (1002, 200,'Afro performances about the different cultures','2023-01-01','2023-01-01','Afro fest','Boone Quad'),
  (1003, 200,'Arab food feet where we share traditional food with the coomunity','2023-01-01','2023-01-01','Arab Food Fest','Boone Quad')
;


CREATE TABLE Yote(
  YoteID INTEGER,
  FirstName TEXT,
  LastName TEXT,
  PRIMARY KEY (YoteID)
);

INSERT INTO Yote VALUES 
  (1,'Rabin','Kalikote'),
  (2,'Abdullah','Korra'),
  (3, 'Dahabo', 'Nour'),
  (4,'Dr.Lynda','Danielson'),
  (5,'Dr.Aaron','Weiss'),
  (6,'Arnold','Hernandez'),
  (7,'Suthi','De Silva'),
  (8,'Silipa','Swai'),
  (9,'Zaynab','El Hakour')
;

CREATE TABLE ExecutiveMember (
  ExecutiveMemberID Integer,
  Position TEXT,
  RoleDescription TEXT,
  PRIMARY KEY (ExecutiveMemberID)
);

INSERT INTO ExecutiveMember VALUES 
  (51, 'President','In charge of leading the rest of the team and reaching out to the supervisor.'),
  (52, 'Vice-President','In charge of co-operating with the President.'),
  (53, 'Secretary','In Charge of leading emails and sending out updates about the events'),
  (54, 'Treasure','In charge of keeping track of the budget spending for events'),
  (55, 'Event coordinator','takes care of communicating with student involvment coordinator to put together events.')
;

CREATE TABLE YoteExecutive (
  ExecutiveMemberID INTEGER,
  YoteID INTEGER,
  PRIMARY KEY (ExecutiveMemberID, YoteID),
  FOREIGN KEY (YoteID) REFERENCES Yote(YoteID),
  FOREIGN KEY (ExecutiveMemberID) REFERENCES ExecutiveMember(ExecutiveMemberID)
);

INSERT INTO YoteExecutive VALUES 
(51,1),
(51,2),
(52,3),
(55,8)
  ;


CREATE TABLE Club (
  ClubID Integer,
  ClubName TEXT NOT NULL,
  Location TEXT,
  Capacity NUMERIC Check (Capacity between 0 and 100),
  Description TEXT,
  MeetingTime Time Check (MeetingTime like '__:__'),
  SupervisorID INTEGER,
  TotalBudget NUMERIC NOT NULL  Check (TotalBudget >= 0),
  EventID INTEGER,
  CreationDate  DATE NOT NULL Check (CreationDate like '____-__-__'),
  PRIMARY KEY (ClubID),
  FOREIGN KEY (EventID) REFERENCES Events(EventID)
  FOREIGN KEY (SupervisorID) REFERENCES Yote(YoteID)
);
INSERT INTO Club VALUES
  (101, 'Coding Club','Boone 106', 10,'A club where we learn how to code and implement it for social good','11:50',4,'1000',1001,'2023-06-05'),
  (102, 'Muslim Club','Mccain Upstairs',15,'A club where we share our Muslim culture with the community','18:00',5,'2000',1003,'2020-06-05'),
  (103, 'Afro Club','Mccain Upstairs',30,'A club where we share our Afro culture with the community','20:00',6,'2500',1002,'2022-06-01');


CREATE TABLE YoteClub (
  ClubID Integer,
  YoteID Integer,
  PRIMARY KEY (ClubID, YoteID),
  FOREIGN KEY (ClubID) REFERENCES Club(ClubID),
  FOREIGN KEY (YoteID) REFERENCES YoteID(YoteID)
);
INSERT INTO YoteClub VALUES
  (101,1),
  (102,2),
  (103,3),
  (101,9),
  (102,9),
  (103,8),
  (101,7)
;

CREATE VIEW Club_Executive_Members as
  SELECT 
  
  c.clubName as 'Club_Name',
  y.FirstName || ' ' || y.LastName as 'Executive_member_name',
  e.Position as 'Executive_member_Position',
  e.RoleDescription as 'Role_Description_of_Executive_Member'
  FROM 
  Club as c
  Join YoteClub as Yc on yc.ClubID = c.ClubID 
  Join Yote as y on yc.YoteID = y.YoteID
  Join YoteExecutive as Ye on ye.YoteID = yc.YoteID
  Join ExecutiveMember as e on e.ExecutiveMemberID = ye.ExecutiveMemberID;

CREATE VIEW Club_Details as 
  SELECT 
  c.clubName as 'Club_Name',
  c.Location as 'Club_Location',
  c.Capacity as 'Club_Capacity',
  c.Description as 'Club_Description',
  c.MeetingTime as 'Meeting_Time',
  c.TotalBudget as 'Total_Budget',
  c.CreationDate as 'Creation_Date',
  s.FirstName || ' ' || s.LastName as 'Supervisor'
  FROM 
  Club as c
  Join Yote as s on s.YoteID = c.supervisorID;

CREATE VIEW Club_Members as 
  SELECT 
  c.clubName as 'Club_Name',
  y.FirstName || ' ' || y.LastName as 'Member_Name'
  FROM 
  Club as c
  join YoteClub as Yc on Yc.ClubID = c.ClubID
  join Yote as y on y.YoteID = Yc.YoteID
  order by c.clubName;

CREATE VIEW Club_Events as 
  SELECT 
  c.clubName as 'Club_Name',
  c.TotalBudget as 'Total_Budget',
  e.EventName as 'Event_Name',
  e.EventLocation as 'Event_Location',
  e.EventDescription as 'Event_Description',
  e.StartDate as 'Event_Start_Date',
  e.EndDate as 'Event_End_Date',
  e.MoneyAlloted as 'Event_Money_Alloted',
  s.FirstName || ' ' || s.LastName as 'Supervisor'
  FROM
  Club as c
  join Events as e on e.EventID = c.EventID
  join Yote as s on s.YoteID = c.supervisorID;

  
  
  



*/
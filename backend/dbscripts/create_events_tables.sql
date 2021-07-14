CREATE TABLE BandGroups (
   groupID INT AUTO_INCREMENT PRIMARY KEY,
   groupName VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE Events (
  eventID INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(60) NOT NULL,
  startTime DATETIME NOT NULL,
  tardyTime DATETIME NOT NULL DEFAULT (startTime + INTERVAL 10 MINUTE),
  groupID INT DEFAULT NULL,

  FOREIGN KEY (groupID) REFERENCES BandGroups (groupID) ON DELETE SET NULL
);

CREATE TABLE Attendance (
  attendanceID INT AUTO_INCREMENT PRIMARY KEY,
  eventID INT NOT NULL,
  userID INT NOT NULL,
  timeArrived TIME,

  FOREIGN KEY (eventID) REFERENCES Events (eventID) ON DELETE CASCADE,
  FOREIGN KEY (userID) REFERENCES Users (userID) ON DELETE CASCADE
);

CREATE TABLE Substitutions (
  eventID INT NOT NULL,
  oldUserID INT NOT NULL,
  newUserID INT NOT NULL,

  FOREIGN KEY (eventID) REFERENCES Events (eventID) ON DELETE CASCADE,
  FOREIGN KEY (oldUserID) REFERENCES Users (userID) ON DELETE CASCADE,
  FOREIGN KEY (newUserID) REFERENCES Users (userID) ON DELETE CASCADE
);

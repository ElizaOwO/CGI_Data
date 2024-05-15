-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-02-2023 a las 01:29:46
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cgi`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `subjectId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `courseweek`
--

CREATE TABLE `courseweek` (
  `id` int(11) NOT NULL,
  `courseId` int(11) NOT NULL,
  `weekId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criteria`
--

CREATE TABLE `criteria` (
  `id` int(11) NOT NULL,
  `criteriaName` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grade`
--

CREATE TABLE `grade` (
  `id` int(11) NOT NULL,
  `criteriaId` int(11) NOT NULL,
  `grade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gradeweek`
--

CREATE TABLE `gradeweek` (
  `id` int(11) NOT NULL,
  `gradeId` int(11) NOT NULL,
  `weekId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group`
--

CREATE TABLE `group` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `letter` char(5) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardex`
--

CREATE TABLE `kardex` (
  `id` int(11) NOT NULL,
  `studentId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexgrade`
--

CREATE TABLE `kardexgrade` (
  `id` int(11) NOT NULL,
  `subjectName` varchar(30) NOT NULL,
  `grade` float NOT NULL,
  `startDate` date NOT NULL,
  `endDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `kardexgrades`
--

CREATE TABLE `kardexgrades` (
  `id` int(11) NOT NULL,
  `kardexId` int(11) NOT NULL,
  `gradeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modality`
--

CREATE TABLE `modality` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(20) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modalitygroup`
--

CREATE TABLE `modalitygroup` (
  `id` int(11) NOT NULL,
  `modalityId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `module`
--

CREATE TABLE `module` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `icon` varchar(30) NOT NULL,
  `order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodicity`
--

CREATE TABLE `periodicity` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `months` int(2) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `periodicitymodality`
--

CREATE TABLE `periodicitymodality` (
  `id` int(11) NOT NULL,
  `periodicityId` int(11) NOT NULL,
  `modalityId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profile`
--

CREATE TABLE `profile` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profilemodule`
--

CREATE TABLE `profilemodule` (
  `id` int(11) NOT NULL,
  `profileId` int(11) NOT NULL,
  `moduleId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `studentCode` varchar(20) NOT NULL,
  `birthDate` date NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  `isPaidUp` tinyint(1) NOT NULL,
  `kardexId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `studentgroup`
--

CREATE TABLE `studentgroup` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `studentId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `code` varchar(20) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teacher`
--

CREATE TABLE `teacher` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `firstName` varchar(30) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `teacherCode` varchar(20) NOT NULL,
  `birthDate` date NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `teachercourse`
--

CREATE TABLE `teachercourse` (
  `id` int(11) NOT NULL,
  `teacherId` int(11) NOT NULL,
  `courseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `userName` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profileId` int(11) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `userprofile`
--

CREATE TABLE `userprofile` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `profileId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `week`
--

CREATE TABLE `week` (
  `id` int(11) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `weekNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `subjectId` (`subjectId`,`groupId`),
  ADD KEY `Course - Group` (`groupId`);

--
-- Indices de la tabla `courseweek`
--
ALTER TABLE `courseweek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `courseId` (`courseId`,`weekId`),
  ADD KEY `CourseWeek - Week` (`weekId`);

--
-- Indices de la tabla `criteria`
--
ALTER TABLE `criteria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `grade`
--
ALTER TABLE `grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `criteriaId` (`criteriaId`);

--
-- Indices de la tabla `gradeweek`
--
ALTER TABLE `gradeweek`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gradeId` (`gradeId`,`weekId`),
  ADD KEY `GradeWeek - Week` (`weekId`);

--
-- Indices de la tabla `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `studentId` (`studentId`);

--
-- Indices de la tabla `kardexgrade`
--
ALTER TABLE `kardexgrade`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `kardexgrades`
--
ALTER TABLE `kardexgrades`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kardexId` (`kardexId`,`gradeId`),
  ADD KEY `KardexGrades - KardexGrade` (`gradeId`);

--
-- Indices de la tabla `modality`
--
ALTER TABLE `modality`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modalitygroup`
--
ALTER TABLE `modalitygroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `modalityId` (`modalityId`,`groupId`),
  ADD KEY `ModalityGroup - Group` (`groupId`);

--
-- Indices de la tabla `module`
--
ALTER TABLE `module`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodicity`
--
ALTER TABLE `periodicity`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `periodicitymodality`
--
ALTER TABLE `periodicitymodality`
  ADD PRIMARY KEY (`id`),
  ADD KEY `periodicityId` (`periodicityId`,`modalityId`),
  ADD KEY `PeriodicityModality - Modality` (`modalityId`);

--
-- Indices de la tabla `profile`
--
ALTER TABLE `profile`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `profilemodule`
--
ALTER TABLE `profilemodule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profileId` (`profileId`,`moduleId`),
  ADD KEY `ProfileModule - Module` (`moduleId`);

--
-- Indices de la tabla `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`,`kardexId`),
  ADD KEY `Student - Kardex` (`kardexId`);

--
-- Indices de la tabla `studentgroup`
--
ALTER TABLE `studentgroup`
  ADD PRIMARY KEY (`id`),
  ADD KEY `groupId` (`groupId`,`studentId`),
  ADD KEY `StudentGroup - Student` (`studentId`);

--
-- Indices de la tabla `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`);

--
-- Indices de la tabla `teachercourse`
--
ALTER TABLE `teachercourse`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacherId` (`teacherId`,`courseId`),
  ADD KEY `TeacherCourse - Course` (`courseId`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `profileId` (`profileId`);

--
-- Indices de la tabla `userprofile`
--
ALTER TABLE `userprofile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userId` (`userId`,`profileId`),
  ADD KEY `userProfile - profile` (`profileId`);

--
-- Indices de la tabla `week`
--
ALTER TABLE `week`
  ADD PRIMARY KEY (`id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `Course - Group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Course - Subject` FOREIGN KEY (`subjectId`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `courseweek`
--
ALTER TABLE `courseweek`
  ADD CONSTRAINT `CourseWeek - Course` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `CourseWeek - Week` FOREIGN KEY (`weekId`) REFERENCES `week` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `grade`
--
ALTER TABLE `grade`
  ADD CONSTRAINT `Grade - Criteria` FOREIGN KEY (`criteriaId`) REFERENCES `criteria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `gradeweek`
--
ALTER TABLE `gradeweek`
  ADD CONSTRAINT `GradeWeek - Grade` FOREIGN KEY (`gradeId`) REFERENCES `grade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `GradeWeek - Week` FOREIGN KEY (`weekId`) REFERENCES `week` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `kardex`
--
ALTER TABLE `kardex`
  ADD CONSTRAINT `Kardex - Student` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `kardexgrades`
--
ALTER TABLE `kardexgrades`
  ADD CONSTRAINT `KardexGrades - Kardex` FOREIGN KEY (`kardexId`) REFERENCES `kardex` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `KardexGrades - KardexGrade` FOREIGN KEY (`gradeId`) REFERENCES `kardexgrade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `modalitygroup`
--
ALTER TABLE `modalitygroup`
  ADD CONSTRAINT `ModalityGroup - Group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ModalityGroup - Modality` FOREIGN KEY (`modalityId`) REFERENCES `modality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `periodicitymodality`
--
ALTER TABLE `periodicitymodality`
  ADD CONSTRAINT `PeriodicityModality - Modality` FOREIGN KEY (`modalityId`) REFERENCES `modality` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `PeriodicityModality - Periodicity` FOREIGN KEY (`periodicityId`) REFERENCES `periodicity` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profilemodule`
--
ALTER TABLE `profilemodule`
  ADD CONSTRAINT `ProfileModule - Module` FOREIGN KEY (`moduleId`) REFERENCES `module` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ProfileModule - Profile` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `Student - Kardex` FOREIGN KEY (`kardexId`) REFERENCES `kardex` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Student - User` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `studentgroup`
--
ALTER TABLE `studentgroup`
  ADD CONSTRAINT `StudentGroup - Group` FOREIGN KEY (`groupId`) REFERENCES `group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `StudentGroup - Student` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `Teacher - User` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `teachercourse`
--
ALTER TABLE `teachercourse`
  ADD CONSTRAINT `TeacherCourse - Course` FOREIGN KEY (`courseId`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `TeacherCourse - Teacher` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user - userProfile` FOREIGN KEY (`profileId`) REFERENCES `userprofile` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `userprofile`
--
ALTER TABLE `userprofile`
  ADD CONSTRAINT `userProfile - profile` FOREIGN KEY (`profileId`) REFERENCES `profile` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `userProfile - user` FOREIGN KEY (`userId`) REFERENCES `user` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

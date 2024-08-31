-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 31, 2024 at 06:25 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestion_proyectos`
--

-- --------------------------------------------------------

--
-- Table structure for table `empleados`
--

CREATE TABLE `empleados` (
  `id_empleado` int(11) NOT NULL,
  `nombre_empleado` varchar(255) NOT NULL,
  `cargo_empleado` varchar(255) DEFAULT NULL,
  `correo_empleado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `empleados`
--

INSERT INTO `empleados` (`id_empleado`, `nombre_empleado`, `cargo_empleado`, `correo_empleado`) VALUES
(1, 'Juan Pérez', 'Gerente de Proyectos', 'juan_perez@gmail.com'),
(2, 'Martha Sanchez', 'Desarrolladora de Software', 'martha_sanchez@gmail.com'),
(3, 'Carlos Gómez', 'Diseñador Web', 'carlos_gomez@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `gestion_de_proyectos`
--

CREATE TABLE `gestion_de_proyectos` (
  `id_proyectos` int(11) NOT NULL,
  `nombre_proyecto` varchar(255) NOT NULL,
  `descripcion_proyecto` text DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `gestion_de_proyectos`
--

INSERT INTO `gestion_de_proyectos` (`id_proyectos`, `nombre_proyecto`, `descripcion_proyecto`, `fecha_inicio`, `fecha_fin`) VALUES
(1, 'Proyecto 1', 'Desarrollo de una nueva aplicación móvil', '2024-01-10', '2024-06-10'),
(2, 'Proyecto 2', 'Rediseño del sitio web corporativo', '2024-03-01', '2024-09-15'),
(3, 'Proyecto 3', 'Implementación de un sistema de gestión de inventarios', '2024-04-20', '2024-11-05');

-- --------------------------------------------------------

--
-- Table structure for table `tareas`
--

CREATE TABLE `tareas` (
  `id_tareas` int(11) NOT NULL,
  `nombre_tarea` varchar(255) NOT NULL,
  `descripcion_tarea` text DEFAULT NULL,
  `id_proyectos` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tareas`
--

INSERT INTO `tareas` (`id_tareas`, `nombre_tarea`, `descripcion_tarea`, `id_proyectos`, `id_empleado`, `status`) VALUES
(1, 'Tarea 1', 'Realizar una reunión con el equipo de desarrollo', 1, 1, 'Completo'),
(2, 'Tarea 2', 'Revision del código', 2, 2, 'Pendiente'),
(3, 'Tarea 3', 'Actualización del Sitio Web', 3, 3, 'En progreso');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`id_empleado`);

--
-- Indexes for table `gestion_de_proyectos`
--
ALTER TABLE `gestion_de_proyectos`
  ADD PRIMARY KEY (`id_proyectos`);

--
-- Indexes for table `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tareas`),
  ADD KEY `id_proyectos` (`id_proyectos`),
  ADD KEY `id_empleado` (`id_empleado`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `tareas_ibfk_1` FOREIGN KEY (`id_proyectos`) REFERENCES `gestion_de_proyectos` (`id_proyectos`),
  ADD CONSTRAINT `tareas_ibfk_2` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

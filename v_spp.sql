-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2023 at 09:20 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `v_spp`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(15) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `jurusan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `jurusan`) VALUES
(2, '10 PPLG 2', 'Rekayasa Perangkat Lunak'),
(4, '10 TKJT 2', 'Teknik Komputer Jaringan'),
(6, '10 BCF 1', 'Broadcasting'),
(7, '10 DKV 1', 'Multimedia'),
(9, '12 MM 2', 'Multimedia'),
(10, '11 RPL  2', 'Rekayasa Perangkat Lunak');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id` int(15) NOT NULL,
  `nama_petugas` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('ADMIN','PETUGAS') NOT NULL,
  `status` enum('AKTIF','PASIF') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id`, `nama_petugas`, `username`, `password`, `level`, `status`) VALUES
(1, 'Tasya ', 'Tasya', '7d19636b89246d5a90c4a7ceb0a7142345bbf020', 'ADMIN', 'AKTIF'),
(2, 'Ramadhinta', 'Ramadhinta', 'a036317b65f0e03c0d45845ffc07956dc7861ea4', 'PETUGAS', 'AKTIF'),
(5, 'Yani', 'yani', '99a123b54e4c74b11c40ce5934bc137b2fbf2531', 'PETUGAS', 'PASIF'),
(6, 'Khoirunnisa', 'Khoirunnisa', 'khoirunnisa', 'ADMIN', 'AKTIF'),
(7, 'Casya', 'Casya', 'casya', 'PETUGAS', 'AKTIF'),
(10, 'Yani', 'yani', 'yayan', 'PETUGAS', 'PASIF');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nisn` int(20) NOT NULL,
  `nis` int(20) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `kelas_id` varchar(50) NOT NULL,
  `alamat` varchar(20) NOT NULL,
  `telp` varchar(25) NOT NULL,
  `level` varchar(15) NOT NULL DEFAULT 'SISWA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `kelas_id`, `alamat`, `telp`, `level`) VALUES
(202020, 2020, 'Caca', '4', 'Jl.Melati', '8947264', 'SISWA'),
(24242424, 2424, 'Sasya', '2', 'Jl.Meru Raya ', '893736224', 'SISWA'),
(80808080, 8080, 'Hyunari', '7', 'Jl.Merawai 2', '094504589375', 'SISWA');

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `id` int(15) NOT NULL,
  `tahun` varchar(50) NOT NULL,
  `bulan` varchar(20) NOT NULL,
  `nominal` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`id`, `tahun`, `bulan`, `nominal`) VALUES
(5, '2023', 'Januari', '420000'),
(6, '2023', 'Februari', '400000'),
(8, '2023', 'Maret', '420000'),
(9, '2023', 'April', '420000'),
(10, '2023', 'Mei', '450000');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(15) NOT NULL,
  `petugas_id` varchar(50) NOT NULL,
  `nisn` varchar(30) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `tgl_bayar` int(20) NOT NULL,
  `bln_bayar` varchar(20) NOT NULL,
  `th_bayar` int(20) NOT NULL,
  `spp_id` varchar(50) NOT NULL,
  `jml_bayar` int(20) NOT NULL,
  `ket` enum('Lunas','Tertunda') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `petugas_id`, `nisn`, `nama`, `tgl_bayar`, `bln_bayar`, `th_bayar`, `spp_id`, `jml_bayar`, `ket`) VALUES
(2, '1', '24242424', 'Sasya', 20, 'Desember', 2022, '5', 350000, 'Lunas'),
(8, '1', '24242424', 'Sasya', 22, 'Mei', 2022, '3', 400000, 'Lunas'),
(10, '2', '80808080', 'Hyunari', 25, 'Januari', 2023, '5', 400000, 'Lunas'),
(11, '1', '24242424', 'Sasya', 22, 'Januari', 2022, '5', 420000, 'Lunas'),
(12, '1', '24242424', 'Sasya', 20, 'Februari', 2023, '6', 400000, 'Lunas'),
(13, '2', '202020', 'Caca', 22, 'Desember', 2022, '3', 420000, 'Lunas'),
(14, '1', '202020', 'Caca', 20, 'Februari', 2023, '6', 400000, 'Lunas'),
(15, 'Tasya ', 'Hyunari', '80808080', 21, 'Februari', 2023, '2023|Februari|400000', 400000, 'Lunas'),
(17, 'Tasya ', 'Hyunari', '80808080', 22, 'April', 2023, '2023|April|420000', 420000, 'Lunas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `kelas_id` (`kelas_id`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `petugas_id` (`petugas_id`,`nisn`,`spp_id`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `spp_id` (`spp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `nisn` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80808081;

--
-- AUTO_INCREMENT for table `spp`
--
ALTER TABLE `spp`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

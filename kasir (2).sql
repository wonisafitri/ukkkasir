-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 26, 2024 at 09:33 AM
-- Server version: 10.3.39-MariaDB-0ubuntu0.20.04.2
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kasir`
--

-- --------------------------------------------------------

--
-- Table structure for table `detailpenjualan`
--

CREATE TABLE `detailpenjualan` (
  `DetailID` int(11) NOT NULL,
  `PenjualanID` int(11) NOT NULL,
  `ProdukID` int(11) NOT NULL,
  `JumlahProduk` int(11) NOT NULL,
  `Subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detailpenjualan`
--

INSERT INTO `detailpenjualan` (`DetailID`, `PenjualanID`, `ProdukID`, `JumlahProduk`, `Subtotal`) VALUES
(1, 4, 4, 1, 3000.00),
(2, 2, 2, 2, 10000.00),
(3, 3, 1, 2, 100000.00),
(4, 1, 5, 1, 4000.00),
(5, 1, 1, 1, 50000.00),
(7, 4, 5, 1, 4000.00),
(8, 4, 2, 2, 10000.00),
(9, 5, 1, 1, 50000.00),
(10, 6, 1, 1, 50000.00),
(11, 6, 0, 0, 0.00),
(12, 7, 1, 1, 50000.00),
(13, 7, 2, 1, 5000.00),
(14, 1, 2, 1, 5000.00),
(59, 10, 1, 1, 50000.00),
(69, 14, 5, 2, 8000.00),
(70, 14, 0, 0, 0.00),
(71, 14, 0, 0, 0.00),
(72, 14, 0, 0, 0.00),
(73, 14, 0, 0, 0.00),
(74, 1, 4, 2, 6000.00),
(76, 2, 0, 0, 0.00),
(79, 15, 1, 1, 50000.00),
(80, 16, 1, 0, 0.00),
(81, 17, 2, 0, 0.00),
(82, 17, 4, 2, 6000.00),
(83, 18, 4, 5, 15000.00),
(84, 20, 2, 3, 15000.00),
(85, 21, 2, 2, 10000.00),
(86, 21, 5, 2, 8000.00),
(87, 22, 5, 1, 4000.00),
(88, 22, 4, 1, 3000.00),
(89, 4, 6, 3, 3000.00);

--
-- Triggers `detailpenjualan`
--
DELIMITER $$
CREATE TRIGGER `pengurangan` AFTER INSERT ON `detailpenjualan` FOR EACH ROW BEGIN
UPDATE produk SET Stok=Stok-NEW.JumlahProduk WHERE ProdukID=NEW.ProdukID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `PelangganID` varchar(20) NOT NULL,
  `NamaPelanggan` varchar(255) NOT NULL,
  `Alamat` text NOT NULL,
  `NomorTelepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`PelangganID`, `NamaPelanggan`, `Alamat`, `NomorTelepon`) VALUES
('2202150256', 'wasiat', 'tuban', '87349793'),
('2302010804', 'nikmah', 'merakurak', '34726347863'),
('2402151843', 'wonisa', 'tuban', '085790318917'),
('2602005917', 'putra', 'tuban', '34726347863'),
('2602070909', 'Diah ', 'merakurak', '12344457'),
('502045551', 'yesy', 'merakurak', '6747869870978'),
('502050348', 'yesi', 'merakurak', '76587908'),
('502054002', 'heni', 'toboo', '76979278927');

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `PenjualanID` int(11) NOT NULL,
  `TanggalPenjualan` date NOT NULL,
  `TotalHarga` decimal(10,2) NOT NULL DEFAULT 0.00,
  `PelangganID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`PenjualanID`, `TanggalPenjualan`, `TotalHarga`, `PelangganID`) VALUES
(4, '2024-02-05', 20000.00, '502054002'),
(10, '2024-02-22', 50000.00, '2202150256'),
(14, '2024-02-23', 8000.00, '2302010804'),
(20, '2024-02-24', 15000.00, '2402151843'),
(21, '2024-02-26', 18000.00, '2602005917'),
(22, '2024-02-26', 7000.00, '2602070909');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(11) NOT NULL,
  `nama_petugas` varchar(255) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `username`, `password`, `level`) VALUES
(3, 'Administrator', 'admin', '1a145a23d6e47aadfe2063f1f951e691', 1),
(4, 'Petugas', 'petugas', '162781b80a86d20168362a869d4e6eeb', 2),
(8, 'wonisaja', 'wonisaja', '691c805e8c841f69c8480a563c70eb43', 2);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `ProdukID` int(11) NOT NULL,
  `NamaProduk` varchar(255) NOT NULL,
  `Harga` decimal(10,2) NOT NULL,
  `Stok` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`ProdukID`, `NamaProduk`, `Harga`, `Stok`) VALUES
(2, 'bolpoin', 5000.00, 23),
(4, 'pensil', 3000.00, 16),
(5, 'Penggaris', 4000.00, 10),
(6, 'penghapus', 1000.00, 20),
(8, 'tipx', 5000.00, 18);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  ADD PRIMARY KEY (`DetailID`),
  ADD KEY `PenjualanID` (`PenjualanID`),
  ADD KEY `PenjualanID_2` (`PenjualanID`),
  ADD KEY `ProdukID` (`ProdukID`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`PelangganID`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`PenjualanID`),
  ADD KEY `PelangganID` (`PelangganID`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ProdukID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailpenjualan`
--
ALTER TABLE `detailpenjualan`
  MODIFY `DetailID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=90;

--
-- AUTO_INCREMENT for table `penjualan`
--
ALTER TABLE `penjualan`
  MODIFY `PenjualanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `petugas`
--
ALTER TABLE `petugas`
  MODIFY `id_petugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `ProdukID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

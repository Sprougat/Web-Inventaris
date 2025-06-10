-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 10, 2025 at 08:18 AM
-- Server version: 9.1.0
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kode_barang` varchar(50) DEFAULT NULL,
  `jumlah_stok` int DEFAULT NULL,
  `stok_minimum` int DEFAULT NULL,
  `satuan` varchar(20) DEFAULT NULL,
  `deskripsi` text,
  `tanggal_kadaluarsa` date DEFAULT NULL,
  `kategori_id` int DEFAULT NULL,
  `pemasok_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `nama`, `kode_barang`, `jumlah_stok`, `stok_minimum`, `satuan`, `deskripsi`, `tanggal_kadaluarsa`, `kategori_id`, `pemasok_id`) VALUES
(1, 'baju', '001', 50, 1, 'pcs', '-', '2005-09-22', 2, 1),
(4, 'baju aldo', '002', 1000, 10, 'pcs', '', '2030-10-10', 1, 1),
(6, 'snackverdi', '003', 100, 10, 'pcs', 'makanan sehat', '2025-06-10', 2, 2),
(7, 'sepatu', '004', 100, 0, 'pcs', '-', '2025-06-11', 2, 1),
(8, 'celanaku', '005', 100, 1, 'pcs', '-', '2025-06-28', 1, 1),
(10, 'bajuku', '006', 100, 1, 'pcs', '-', '2025-06-13', 3, 1),
(12, 'makananku', '007', 80, 10, 'pcs', '-', '2025-06-12', 2, 2),
(13, 'barangbaru', '008', 70, 10, 'pcs', '-', '2025-06-12', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `kategori_barang`
--

CREATE TABLE `kategori_barang` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `deskripsi` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `kategori_barang`
--

INSERT INTO `kategori_barang` (`id`, `nama`, `deskripsi`) VALUES
(1, 'baju', '-'),
(2, 'makanan', ''),
(3, 'Pakaian', '');

-- --------------------------------------------------------

--
-- Table structure for table `log_aktivitas`
--

CREATE TABLE `log_aktivitas` (
  `id` int NOT NULL,
  `pengguna_id` int DEFAULT NULL,
  `aktivitas` text,
  `detail` text,
  `tanggal_waktu` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `log_aktivitas`
--

INSERT INTO `log_aktivitas` (`id`, `pengguna_id`, `aktivitas`, `detail`, `tanggal_waktu`) VALUES
(1, 1, 'LOGIN', 'Pengguna \'2311102099\' berhasil login.', '2025-06-10 09:22:36'),
(2, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 09:27:10'),
(3, 1, 'LOGIN', 'Pengguna \'2311102099\' berhasil login.', '2025-06-10 09:27:52'),
(4, 1, 'BARANG', 'Admin \'rafaldo\' menambahkan barang baru: baju', '2025-06-10 09:30:59'),
(5, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 10:32:05'),
(6, 1, 'LOGIN', 'Pengguna \'2311102099\' berhasil login.', '2025-06-10 10:32:35'),
(7, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 10:33:36'),
(8, 1, 'LOGIN', 'Pengguna \'2311102099\' berhasil login.', '2025-06-10 10:35:00'),
(9, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 10:40:00'),
(10, 1, 'LOGIN', 'Pengguna \'2311102099\' berhasil login.', '2025-06-10 10:41:20'),
(11, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 10:52:18'),
(12, 4, 'BARANG', 'Pengguna \'staff\' menambahkan barang baru: makananku', '2025-06-10 10:52:50'),
(13, 1, 'LOGIN', 'Pengguna \'2311102099\' berhasil login.', '2025-06-10 10:53:23'),
(14, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 10:55:47'),
(15, 1, 'LOGIN', 'Pengguna \'2311102099\' berhasil login.', '2025-06-10 10:56:02'),
(16, 1, 'BARANG', 'Pengguna \'rafaldo\' mengedit data barang: makananku', '2025-06-10 10:56:45'),
(17, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 11:09:01'),
(18, 4, 'BARANG', 'Pengguna \'staff\' menambahkan barang baru: barangbaru', '2025-06-10 11:09:41'),
(19, 4, 'LOGIN', 'Pengguna \'staff\' berhasil login.', '2025-06-10 13:12:29');

-- --------------------------------------------------------

--
-- Table structure for table `order_pemasok`
--

CREATE TABLE `order_pemasok` (
  `id` int NOT NULL,
  `pemasok_id` int DEFAULT NULL,
  `tanggal_order` date DEFAULT NULL,
  `tanggal_estimasi` date DEFAULT NULL,
  `tanggal_diterima` date DEFAULT NULL,
  `status` enum('dipesan','dikirim','diterima') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_pemasok_detail`
--

CREATE TABLE `order_pemasok_detail` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `barang_id` int DEFAULT NULL,
  `jumlah` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pemasok`
--

CREATE TABLE `pemasok` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` text,
  `no_telp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pemasok`
--

INSERT INTO `pemasok` (`id`, `nama`, `alamat`, `no_telp`, `email`) VALUES
(1, 'AldoCorp', 'purwokerto timur', '087876974117', 'aldocorp@gmail.com'),
(2, 'VerdiFood', 'banyumas', '08123456789', 'verdifood@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `id` int NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `peran` enum('admin','staf') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`id`, `nama`, `username`, `password`, `email`, `peran`) VALUES
(1, 'rafaldo', '2311102099', '12345678', 'aldo@gmail.com', 'admin'),
(4, 'staff', 'staff', '12345678', 'staff@gmail.com', 'staf');

-- --------------------------------------------------------

--
-- Table structure for table `riwayat_stok`
--

CREATE TABLE `riwayat_stok` (
  `id` int NOT NULL,
  `barang_id` int DEFAULT NULL,
  `stok_awal` int DEFAULT NULL,
  `stok_akhir` int DEFAULT NULL,
  `perubahan` int DEFAULT NULL,
  `tanggal` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_stok`
--

CREATE TABLE `transaksi_stok` (
  `id` int NOT NULL,
  `pengguna_id` int DEFAULT NULL,
  `jenis` enum('masuk','keluar') DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `keterangan` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi_stok`
--

INSERT INTO `transaksi_stok` (`id`, `pengguna_id`, `jenis`, `tanggal`, `keterangan`) VALUES
(1, 1, 'keluar', '2025-06-10', 'Barang Rusak - '),
(2, 1, 'keluar', '2025-06-10', 'Barang Kadaluwarsa - expired'),
(3, 4, 'keluar', '2025-06-10', 'Barang Rusak - -');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_stok_detail`
--

CREATE TABLE `transaksi_stok_detail` (
  `id` int NOT NULL,
  `transaksi_id` int DEFAULT NULL,
  `barang_id` int DEFAULT NULL,
  `jumlah` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaksi_stok_detail`
--

INSERT INTO `transaksi_stok_detail` (`id`, `transaksi_id`, `barang_id`, `jumlah`) VALUES
(1, 1, 1, 50),
(2, 2, 12, 20),
(3, 3, 13, 30);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `kode_barang` (`kode_barang`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `pemasok_id` (`pemasok_id`);

--
-- Indexes for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengguna_id` (`pengguna_id`);

--
-- Indexes for table `order_pemasok`
--
ALTER TABLE `order_pemasok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pemasok_id` (`pemasok_id`);

--
-- Indexes for table `order_pemasok_detail`
--
ALTER TABLE `order_pemasok_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `pemasok`
--
ALTER TABLE `pemasok`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `riwayat_stok`
--
ALTER TABLE `riwayat_stok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `transaksi_stok`
--
ALTER TABLE `transaksi_stok`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pengguna_id` (`pengguna_id`);

--
-- Indexes for table `transaksi_stok_detail`
--
ALTER TABLE `transaksi_stok_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transaksi_id` (`transaksi_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategori_barang`
--
ALTER TABLE `kategori_barang`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order_pemasok`
--
ALTER TABLE `order_pemasok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_pemasok_detail`
--
ALTER TABLE `order_pemasok_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pemasok`
--
ALTER TABLE `pemasok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `riwayat_stok`
--
ALTER TABLE `riwayat_stok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi_stok`
--
ALTER TABLE `transaksi_stok`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaksi_stok_detail`
--
ALTER TABLE `transaksi_stok_detail`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `barang_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori_barang` (`id`),
  ADD CONSTRAINT `barang_ibfk_2` FOREIGN KEY (`pemasok_id`) REFERENCES `pemasok` (`id`);

--
-- Constraints for table `log_aktivitas`
--
ALTER TABLE `log_aktivitas`
  ADD CONSTRAINT `log_aktivitas_ibfk_1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`);

--
-- Constraints for table `order_pemasok`
--
ALTER TABLE `order_pemasok`
  ADD CONSTRAINT `order_pemasok_ibfk_1` FOREIGN KEY (`pemasok_id`) REFERENCES `pemasok` (`id`);

--
-- Constraints for table `order_pemasok_detail`
--
ALTER TABLE `order_pemasok_detail`
  ADD CONSTRAINT `order_pemasok_detail_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `order_pemasok` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_pemasok_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);

--
-- Constraints for table `riwayat_stok`
--
ALTER TABLE `riwayat_stok`
  ADD CONSTRAINT `riwayat_stok_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);

--
-- Constraints for table `transaksi_stok`
--
ALTER TABLE `transaksi_stok`
  ADD CONSTRAINT `transaksi_stok_ibfk_1` FOREIGN KEY (`pengguna_id`) REFERENCES `pengguna` (`id`);

--
-- Constraints for table `transaksi_stok_detail`
--
ALTER TABLE `transaksi_stok_detail`
  ADD CONSTRAINT `transaksi_stok_detail_ibfk_1` FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi_stok` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transaksi_stok_detail_ibfk_2` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

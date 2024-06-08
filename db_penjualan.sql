-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2024 at 10:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_penjualan`
--
CREATE DATABASE IF NOT EXISTS `db_penjualan` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_penjualan`;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `id` int(8) NOT NULL,
  `barcode` int(20) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `harga_jual` bigint(20) DEFAULT NULL,
  `harga_beli` bigint(20) DEFAULT NULL,
  `stok` int(10) DEFAULT NULL,
  `kategori_id` int(8) DEFAULT NULL,
  `satuan_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL,
  `suplier_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`id`, `barcode`, `name`, `harga_jual`, `harga_beli`, `stok`, `kategori_id`, `satuan_id`, `user_id`, `suplier_id`) VALUES
(1, 1122100201, 'daolpin garam 500g', 13500, 13500, 31, 4, 4, 3, 2),
(2, 1122100202, 'frestea jasmine minuman teh rasa melati botol 1.5L', 17900, 17900, 102, 2, 3, 2, 4),
(3, 1122100203, 'imboost 4 tablet', 19500, 19500, 93, 3, 4, 5, 4),
(4, 1122100204, 'rebo kuai biji bunga matahari green tea 140g', 18000, 18000, 53, 5, 1, 5, 1),
(5, 1122100205, 'indomie mi instan soto mie 70g', 2500, 3100, 120, 1, 5, 4, 2);

-- --------------------------------------------------------

--
-- Table structure for table `detail_beli`
--

CREATE TABLE `detail_beli` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `pembelian_id` int(8) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_beli`
--

INSERT INTO `detail_beli` (`id`, `harga`, `qty`, `subtotal`, `pembelian_id`, `barang_id`) VALUES
(1, 762600, 41, 762600, 1, 4),
(2, 250000, 100, 250000, 2, 5),
(3, 975000, 50, 975000, 3, 3),
(4, 1969000, 110, 1969000, 4, 2),
(5, 600000, 50, 600000, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `detail_jual`
--

CREATE TABLE `detail_jual` (
  `id` int(8) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `qty` int(10) DEFAULT NULL,
  `subtotal` bigint(20) DEFAULT NULL,
  `penjualan_id` int(8) DEFAULT NULL,
  `barang_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `detail_jual`
--

INSERT INTO `detail_jual` (`id`, `harga`, `qty`, `subtotal`, `penjualan_id`, `barang_id`) VALUES
(1, 18600, 6, 18600, 1, 5),
(2, 39000, 2, 39000, 2, 3),
(3, 35800, 2, 35800, 3, 2),
(4, 27000, 2, 27000, 4, 1),
(5, 90000, 5, 90000, 5, 4);

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id`, `name`) VALUES
(4, 'bahan pokok'),
(3, 'kesehatan'),
(7, 'koko crunch'),
(5, 'makanan ringan'),
(2, 'minuman');

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE `kustomer` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` char(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` char(100) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kustomer`
--

INSERT INTO `kustomer` (`id`, `nik`, `name`, `telp`, `email`, `alamat`) VALUES
(1, 110002201, 'Lestari', '+62142630600', NULL, NULL),
(2, 110002202, 'Dian', '+62312761683', 'dian@gmail.com', NULL),
(3, 110002203, 'Jair Tinendung', '+6207242514669', 'jailtime@gmail.com', 'Jl Setia 76, Sumatera Utara'),
(4, 110002204, 'Hartanoe Wei', '+6222980051689', NULL, 'Jl Leuwipanjang 124, Jawa Barat'),
(5, 110002205, 'Dwi', '+62953210562', 'dwi@gmail.com', 'Jl Buahbatu 237, Jawa Barat');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(20) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `suplier_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id`, `invoice`, `total`, `bayar`, `diskripsi`, `tanggal`, `suplier_id`, `user_id`) VALUES
(1, 2221, 762600, 762600, NULL, '2024-05-04', 1, 1),
(2, 250000, 250000, 250000, NULL, '2024-05-04', 2, 2),
(3, 975000, 975000, 975000, NULL, '2024-05-03', 3, 3),
(4, 1969000, 1969000, 1969000, NULL, '2024-05-03', 2, 4),
(5, 600000, 600000, 600000, NULL, '2024-05-03', 5, 5);

-- --------------------------------------------------------

--
-- Table structure for table `penjualan`
--

CREATE TABLE `penjualan` (
  `id` int(8) NOT NULL,
  `invoice` int(20) DEFAULT NULL,
  `total` bigint(200) DEFAULT NULL,
  `bayar` bigint(11) DEFAULT NULL,
  `kembali` int(11) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `kustomer_id` int(8) DEFAULT NULL,
  `user_id` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `penjualan`
--

INSERT INTO `penjualan` (`id`, `invoice`, `total`, `bayar`, `kembali`, `tanggal`, `kustomer_id`, `user_id`) VALUES
(1, 27000, 27000, 27000, 0, '2024-05-04', 1, NULL),
(2, 35800, 35800, 50000, 14200, '2024-05-05', 2, NULL),
(3, 19500, 19500, 20000, 500, '2024-05-04', 3, NULL),
(4, 54000, 54000, 54000, 0, '2024-05-04', 4, NULL),
(5, 31000, 31000, 31000, 0, '2024-05-05', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `satuan`
--

CREATE TABLE `satuan` (
  `id` int(8) NOT NULL,
  `name` char(100) DEFAULT NULL,
  `diskripsi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `satuan`
--

INSERT INTO `satuan` (`id`, `name`, `diskripsi`) VALUES
(1, 'piattos snack kentang rumput laut 75g', 'piattos snack kentang rumput laut 75g merupakan sebuah keripik berbentuk unik.'),
(2, 'imboost 4 tablet', 'imboost 4 tablet merupakan sejenis suplemen yang sering digunakan untuk terapi suportif, membantu dalam meningkatkan daya tahan tubuh.'),
(3, 'frestea jasmine minuman teh rasa melati botol 1.5 L', 'frestea jasmine minuman teh rasa melati botol 1.5 L merupakan minuman teh berkemasan dengan rasa bunga melati.'),
(4, 'dolpin garam 500 g', 'dolpin garam 500g adalah garam konsumsi yang dihasilkan dari teknologi pemurnian yang modern dengan kualitas yang baik'),
(5, 'indomie mi instan soto mie 70g', 'indomiea mi instan soto mie 70g merupakan salah satu jenis mi instan dengan varian kuah.');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `perusahaan` varchar(150) DEFAULT NULL,
  `nama_bank` varchar(150) DEFAULT NULL,
  `nama_akun_bank` varchar(150) DEFAULT NULL,
  `no_akun_bank` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`id`, `nik`, `name`, `telp`, `email`, `alamat`, `perusahaan`, `nama_bank`, `nama_akun_bank`, `no_akun_bank`) VALUES
(1, 1902070001, 'Mark Tambak', '0(94)5216832', 'tambak@outlook.com', 'Jl Asia 204 Kel Sei Rengas 2, Sumatera Utara\r\n\r\n', 'Cita Rasa Lezat', 'mandiri', NULL, NULL),
(2, 1902070002, 'Sutikno', '4(3894)2838447', 'tikno@gmail.com', 'Gg Mangga 11 A, Sumatera Utara', 'Indofood Sukses Makmur Tbk', 'mandiri', NULL, NULL),
(3, 1902070003, 'Yulia Widya Tedjo', '1(84)477-53-73', 'Yulia@outlook.com', 'Jl Jend Gatot Subroto 203, Sumatera Utara', 'Cita Rasa Segar', 'mandiri', NULL, NULL),
(4, 1902070004, 'Sunardi Liwei', '+62344167128', 'Sunardi_liwei@hotmail.com', 'Kompl Tmn Setia Budi Indah Bl UU/49, Sumatera Utara', 'PT Metro Healthcare Indonesia Tbk', 'mandiri', NULL, NULL),
(5, 1902070005, 'Widargo Yongnian', '+6235771849124', 'Widargo@gmail.com', 'Jl P Komarudin, Dki Jakarta', 'PT. Korin Intiwira Sejahtera', 'mandiri', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(8) NOT NULL,
  `nik` int(16) DEFAULT NULL,
  `username` char(100) DEFAULT NULL,
  `full_name` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` char(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `telp` char(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `is_active` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nik`, `username`, `full_name`, `password`, `role`, `email`, `telp`, `alamat`, `is_active`) VALUES
(1, 110001101, 'Suharto', 'Suharto', 'm*CeakS#uwoFczf$Gs!xFCkosHbnsv', 'manajer', 'shto@outlook.com', '081200112', 'Jl Pemuda Baru II 26, Sumatera Utara', 'yes'),
(2, 110001102, 'sala', 'Delfine Salasiwa', 'qPuQz%yU#WEP!PyeUiGGYMZw$d*LPu', 'kasir', 'sssSalasiwa@gmail.com', '083002324', ' Jl Asia 6, Sumatera Utara', 'yes'),
(3, 110001103, 'oyo', 'Handoyo Liwei', 'EDoKaCPd$PYzBHeEvNHmvb^%!F!%Wm', 'staf gudang', 'Liwei@gmail.com', '085122290', ' Jl Sultan Iskandar Muda 1, Sumatera Utara', 'yes'),
(4, 110001104, 'Winoto', 'Winoto Wuzhou', 'ib@JBiGZoiqYJuCV%@XZnQSbsyZS^g', 'staf gudang', 'Winoto@gmail.com', '084212999', 'Jl Dr Sutomo 277 A-B, Sumatera Utara', 'yes'),
(5, 110001105, 'Wangi', 'Wangi', 'de&qCTYnkuSovTL#$cgZJ*v*aK@Gb@', 'helper', 'wangi@gmail.com', '081311220', 'Jl Pertempuran 125, Sumatera Utara', 'yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_kategori` (`kategori_id`),
  ADD KEY `fk_satuan` (`satuan_id`),
  ADD KEY `fk_user` (`user_id`),
  ADD KEY `fk_suplier` (`suplier_id`);

--
-- Indexes for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`pembelian_id`,`barang_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `penjualan_id` (`penjualan_id`,`barang_id`),
  ADD KEY `barang_id` (`barang_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Key` (`name`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suplier_id` (`suplier_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kustomer_id` (`kustomer_id`,`user_id`);

--
-- Indexes for table `satuan`
--
ALTER TABLE `satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `barang`
--
ALTER TABLE `barang`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `satuan`
--
ALTER TABLE `satuan`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `barang`
--
ALTER TABLE `barang`
  ADD CONSTRAINT `fk_kategori` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`id`),
  ADD CONSTRAINT `fk_satuan` FOREIGN KEY (`satuan_id`) REFERENCES `satuan` (`id`),
  ADD CONSTRAINT `fk_suplier` FOREIGN KEY (`suplier_id`) REFERENCES `supplier` (`id`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `detail_beli`
--
ALTER TABLE `detail_beli`
  ADD CONSTRAINT `detail_beli_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`),
  ADD CONSTRAINT `detail_beli_ibfk_2` FOREIGN KEY (`pembelian_id`) REFERENCES `pembelian` (`id`);

--
-- Constraints for table `detail_jual`
--
ALTER TABLE `detail_jual`
  ADD CONSTRAINT `detail_jual_ibfk_1` FOREIGN KEY (`barang_id`) REFERENCES `barang` (`id`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`suplier_id`) REFERENCES `supplier` (`id`);

--
-- Constraints for table `penjualan`
--
ALTER TABLE `penjualan`
  ADD CONSTRAINT `penjualan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `detail_jual` (`penjualan_id`),
  ADD CONSTRAINT `penjualan_ibfk_2` FOREIGN KEY (`kustomer_id`) REFERENCES `kustomer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

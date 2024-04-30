-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 29 Apr 2024 pada 23.54
-- Versi server: 10.4.18-MariaDB
-- Versi PHP: 7.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_kriteria`
--

CREATE TABLE `detail_kriteria` (
  `id_dkriteria` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `sub_kriteria` text NOT NULL,
  `nilai_rasio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_kriteria`
--

INSERT INTO `detail_kriteria` (`id_dkriteria`, `id_kriteria`, `sub_kriteria`, `nilai_rasio`) VALUES
(9, 4, 'Biasa', 1),
(10, 4, 'Cukup Ketat', 2),
(11, 4, 'Ketat', 4),
(12, 4, 'Sangat Ketat', 6),
(13, 3, 'Resitas', 1),
(14, 3, 'Ceramah', 2),
(15, 3, 'Demonstrasi', 3),
(17, 3, 'Gabungan', 4),
(18, 5, 'Tidak Rajin', 1),
(19, 5, 'Rajin', 4),
(20, 5, 'Sangat Rajin', 6),
(42, 2, 'Biasa', 1),
(43, 2, 'Dekat', 4),
(44, 2, 'Sangat Dekat', 6),
(51, 34, '< 1 tahun', 1),
(52, 34, '< 2 tahun', 2),
(53, 34, '< 3 tahun', 3),
(54, 34, '< 4 tahun', 4),
(55, 34, '< 5 tahun', 5),
(56, 34, '> 5 tahun', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `ir`
--

CREATE TABLE `ir` (
  `id_ir` int(11) NOT NULL,
  `ri` int(11) NOT NULL,
  `nilai` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `ir`
--

INSERT INTO `ir` (`id_ir`, `ri`, `nilai`) VALUES
(1, 2, 0),
(4, 3, 0.58),
(5, 4, 0.9),
(6, 5, 1.12),
(7, 6, 1.24),
(8, 7, 1.32),
(9, 8, 1.41),
(10, 9, 1.45),
(11, 10, 1.49);

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL,
  `nama_kriteria` text DEFAULT NULL,
  `keterangan` text NOT NULL,
  `type` text NOT NULL,
  `bobot_prioritas` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id_kriteria`, `nama_kriteria`, `keterangan`, `type`, `bobot_prioritas`) VALUES
(2, 'K1', 'Hubungan Dengan Siswa', 'Benefit', 0.12895),
(3, 'K2', 'Metode Pembelajaran', 'Benefit', 0.14202),
(4, 'K3', 'Metode Evaluasi Pembelajaran', 'Benefit', 0.19984),
(5, 'K4', 'Kehadiran', 'Benefit', 0.17545),
(34, 'K5', 'Masa Kerja', 'Benefit', 0.25792),
(35, 'K6', 'tes', 'Benefit', 0.09582);

-- --------------------------------------------------------

--
-- Struktur dari tabel `perbandingan_kriteria`
--

CREATE TABLE `perbandingan_kriteria` (
  `id_perkri` int(11) NOT NULL,
  `kriteria1` varchar(50) NOT NULL,
  `kriteria2` varchar(50) NOT NULL,
  `nilai_pembanding` float NOT NULL,
  `id_kriteria` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `perbandingan_kriteria`
--

INSERT INTO `perbandingan_kriteria` (`id_perkri`, `kriteria1`, `kriteria2`, `nilai_pembanding`, `id_kriteria`) VALUES
(29, '2', '3', 1, 2),
(30, '2', '4', 0.333333, 2),
(31, '2', '5', 1, 2),
(32, '2', '15', 0.5, 2),
(33, '3', '4', 1, 3),
(34, '3', '5', 0.5, 3),
(35, '3', '15', 0.333333, 3),
(36, '4', '5', 2, 4),
(37, '4', '15', 0.5, 4),
(38, '5', '15', 1, 5),
(39, '2', '28', 0.5, 2),
(40, '3', '28', 0.333333, 3),
(41, '4', '28', 0.5, 4),
(42, '5', '28', 1, 5),
(43, '2', '29', 0.5, 2),
(44, '3', '29', 0.333333, 3),
(45, '4', '29', 0.5, 4),
(46, '5', '29', 1, 5),
(47, '2', '34', 0.5, 2),
(48, '3', '34', 0.333333, 3),
(49, '4', '34', 0.5, 4),
(50, '5', '34', 1, 5),
(51, '2', '35', 2, 2),
(52, '3', '35', 3, 3),
(53, '4', '35', 1, 4),
(54, '5', '35', 2, 5),
(55, '34', '35', 2, 34);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_kriteria`
--
ALTER TABLE `detail_kriteria`
  ADD PRIMARY KEY (`id_dkriteria`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- Indeks untuk tabel `ir`
--
ALTER TABLE `ir`
  ADD PRIMARY KEY (`id_ir`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id_kriteria`);

--
-- Indeks untuk tabel `perbandingan_kriteria`
--
ALTER TABLE `perbandingan_kriteria`
  ADD PRIMARY KEY (`id_perkri`),
  ADD KEY `id_kriteria` (`id_kriteria`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_kriteria`
--
ALTER TABLE `detail_kriteria`
  MODIFY `id_dkriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT untuk tabel `ir`
--
ALTER TABLE `ir`
  MODIFY `id_ir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id_kriteria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `perbandingan_kriteria`
--
ALTER TABLE `perbandingan_kriteria`
  MODIFY `id_perkri` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_kriteria`
--
ALTER TABLE `detail_kriteria`
  ADD CONSTRAINT `detail_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);

--
-- Ketidakleluasaan untuk tabel `perbandingan_kriteria`
--
ALTER TABLE `perbandingan_kriteria`
  ADD CONSTRAINT `id_kriteria` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

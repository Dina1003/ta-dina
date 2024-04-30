<?php
include('../config.php');

$koneksi = new mysqli("localhost", "root", "", "test");

// Periksa koneksi
if ($koneksi->connect_error) {
    die("Koneksi ke database gagal: " . $koneksi->connect_error);
}

$id_kriteria     = $_POST['kriteria'];
$sub_kriteria    = $_POST['sub_kriteria'];
$nilai_rasio     = $_POST['nilai_rasio'];

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nama = $_POST['sub_kriteria'];

    // Query untuk memeriksa apakah data sudah ada di database
    // $check_query = "SELECT sub_kriteria FROM detail_kriteria WHERE sub_kriteria = '$nama'";
    // $check_result = $koneksi->query($check_query);

    // if ($check_result->num_rows > 0) {
    //     // Jika data sudah ada di database, tampilkan pesan
    //     echo "<script>
    //       alert ('Maaf, Data Sudah Tersedia')
    //       document.location.href='../admin/kelola-subkriteria.php'
    //       </script>";
    // } else {

        $result = $mysqli->query("INSERT INTO `detail_kriteria` (`id_dkriteria`,`id_kriteria`,`sub_kriteria`, `nilai_rasio`) VALUES ('', '" . $id_kriteria . "', '" . $sub_kriteria . "', '" . $nilai_rasio . "');");
        if (!$result) {
            echo "<script language='javascript'> window.alert('Mohon perhatikan inputan data'); window.location=('../admin/form-tambah-subkriteria.php')
				</script>";
            exit();
        } else {
            header('Location: ../admin/kelola-subkriteria.php');
        }
    // }
}

// Tutup koneksi database
$koneksi->close();
?>

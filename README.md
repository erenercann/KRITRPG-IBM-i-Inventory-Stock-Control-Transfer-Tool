# KRITRPG-IBM-i-Inventory-Stock-Control-Transfer-Tool
Bu proje, bir işletmenin envanterindeki stok seviyelerini takip etmek ve kritik seviyenin altına düşen ürünleri raporlamak amacıyla geliştirilmiştir.


Proje Adı: IBM i (AS/400) Kritik Stok Kontrol ve Transfer Sistemi
(IBM i Inventory Stock Control & Transfer Tool)

1. Genel Bakış
Bu proje, bir işletmenin envanterindeki stok seviyelerini takip etmek ve kritik seviyenin altına düşen ürünleri raporlamak amacıyla geliştirilmiş uçtan uca bir IBM i uygulamasıdır. Kullanıcıdan alınan parametrelere göre veritabanını tarar ve sonuçları harici bir transfer dosyasına aktarır.
2. Projenin Amacı
Depo yönetim süreçlerinde, stok miktarı belirli bir limitin altına düşen ürünlerin hızlıca tespit edilmesini sağlamaktır. Üretilen transfer dosyası (TRFKRIT), daha sonra Excel'e aktarılmak veya satın alma birimine raporlanmak üzere hazır bir veri kaynağı oluşturur.
3. Teknik Mimari ve Bileşenler
Program, IBM i'nin klasik "Modüler Katmanlı Mimari" yapısını kullanmaktadır:
    * Veritabanı (Physical Files - PF):
        * STOKP: Ana stok bilgilerini (Kod, Ad, Miktar) tutan birincil dosya.
        * TRFKRIT: Kritik stokların yazıldığı, anahtarlı (keyed) raporlama dosyası.
    * Arayüz (Display File - DSPF):
        * Kullanıcının depo kodu ve minimum stok miktarını girebileceği, işlem sonunda "Başarılı" mesajı gösteren etkileşimli ekran.
    * İş Mantığı (RPGLE - Fixed Format):
        * Veritabanını baştan sona tarar, miktar karşılaştırması yapar ve transfer dosyasını doldurur.
    * Kontrol ve Otomasyon (CLLE):
        * Süreci yöneten ana programdır. Her çalışmada transfer dosyasını temizler (CLRPFM) ve RPG programını tetikler.
4. İş Akışı (Workflow)
    1- CL Programı çalıştırılır ve hedef tabloyu sıfırlar.
    2- RPG Programı kullanıcıya bir ekran sunarak "Min. Miktar" limitini sorar.
    3- Veritabanı (STOKP) üzerinde döngü kurularak limitin altındaki ürünler TRF_YAZ subroutine'i ile transfer dosyasına eklenir.
    4- İşlem bitince kullanıcıya görsel bir pencere (Window) ile onay verilir.

--------------------------------------------------------------------------------------------------

Project Name: IBM i (AS/400) Critical Inventory Control and Transfer System

1. Overview
This project is an end-to-end IBM i (AS/400) application developed to monitor inventory stock levels and report products that fall below a critical threshold. It scans the database based on user-defined parameters and exports the results to an external transfer file.
2. Purpose
The main objective is to provide a fast identification of low-stock items in warehouse management. The generated transfer file (TRFKRIT) serves as a ready-to-use data source for Excel exports or procurement department reports.
3. Technical Architecture & Components
The application follows the classic "Modular Layered Architecture" of IBM i:
    * Database (Physical Files - PF):
        * STOKP: Master file containing inventory details (Code, Name, Quantity).
        * TRFKRIT: Keyed reporting file where critical stock data is written.
    * User Interface (Display File - DSPF):
        * Interactive screen for inputting warehouse codes and minimum stock quantities, featuring a success message window.
    * Business Logic (RPGLE - Fixed Format):
        * Iterates through the database, performs quantity comparisons, and populates the transfer file.
    * Control & Automation (CLLE):
        * The orchestrator program. It clears the transfer file (CLRPFM) before execution and calls the RPG program.
4. Workflow
    1- The CL Program is executed and clears the target table to ensure data integrity.
    2- The RPG Program prompts the user for a "Min. Quantity" threshold via a display file.
    3- The program loops through the Master File (STOKP), and items below the limit are added to the transfer file using the TRF_YAZ subroutine.
    4- Upon completion, a visual confirmation window is displayed to the user.

Teknik Detaylar / Technical Specs
    * Language: RPGLE (Fixed Format), CLLE
    * OS: IBM i (OS/400)
    * Database: DB2 for i (DDS defined Physical Files)
    * UI: DDS defined Display Files (SDA)
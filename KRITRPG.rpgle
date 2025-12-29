       FSTOKP     IF   E           K DISK                                         
       FTRFKRIT   O  A E           K DISK                                         
       FKRITDSPF  CF   E             WORKSTN                                      
        *                                                                         
       C     *ENTRY        PLIST                                                  
       C                   PARM                    pDEPOT            2            
        *                                                                         
        * Ana Döngü                                                               
       C                   DOU       *IN03 = *ON                                  
       C                   EXFMT     DSPPRM                                       
       C                   IF        *IN03 = *OFF                                 
        *                                                                         
        *  Stok dosyasini oku ve limitin altindakileri yaz                        
       C     *LOVAL        SETLL     STOKP                                        
       C                   READ      STOKP                                  99    
       C                   DOW       *IN99 = *OFF                                 
        *                                                                         
        * Filtreleme (Depo ve Miktar Kontrolü)                                    
       C                   IF        SQTY < EMINQTY                               
       C                   EXSR      TRF_YAZ                                  
       C                   ENDIF                                              
        *                                                                     
       C                   READ      STOKP                                  99
       C                   ENDDO                                              
        *                                                                     
        *  Bitis Penceresini Göster                                           
       C                   EXFMT     WIN001                                   
        *                                                                     
       C                   ENDIF                                              
       C                   ENDDO                                              
        *                                                                     
       C                   SETON                                        LR    
        *                                                                     
       C     TRF_YAZ       BEGSR                                              
       C                   EVAL      TKCODE = SKODE                           
       C                   EVAL      TKNAME = SNAME                           
       C                   EVAL      TKQTY  = SQTY                            
       C                   EVAL      TKMIN  = EMINQTY                         
       C                   WRITE     TRFKRITR                                 
       C                   ENDSR           
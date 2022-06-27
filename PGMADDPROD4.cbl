 Columns . . . :    6 100                                       Edit                                            YALTAMAR2/QRPGLESRC 
 SEU==>                                                                                                                  PGMADDPROD 
 FMT FX FFilename++IPEASF.....L.....A.Device+.Keywords+++++++++++++++++++++++++++++Comments++++++++++++                             
        *************** Beginning of data ***************************************************************************************   
0001.00 Fproductos UF A E           K DISK                                                                  220603                  
0002.00 FpproductosCF   E             WORKSTN PREFIX(p)                                                     220603                  
0002.01 Fmarcas    IF   E           K DISK    PREFIX(m)                                                     220613                  
0002.02 Fbitacoras UF A E           K DISK    PREFIX(b)                                                     220607                  
0002.03                                                                                                     220607                  
0002.04 Dpgmaddprod       PI                                                                                220607                  
0002.05 DauxiBitacora                   11S 0                                                               220607                  
0002.06 DauxiLogin                      11S 0                                                               220607                  
0003.00                                                                                                     220603                  
0003.01 DauxiProducto     S             11S 0                                                               220603                  
0003.02                                                                                                     220603                  
0004.00  /free                                                                                              220603                  
0004.01    Exsr inicializar;                                                                                220603                  
0004.02    Exsr genIdProducto;                                                                              220606                  
0004.05    Exfmt panta01;                                                                                   220603                  
0004.06    Dow *in03 = '0';                                                                                 220603                  
0004.07      Exsr consultaMarca;                                                                            220603                  
0004.08      If *in04 = '1';                                                                                220603                  
0004.09        codproduct = pcodproduct;                                                                    220603                  
0004.10        idmarca = Pidmarca;                                                                          220603                  
0004.11        nombre = pnombre;                                                                            220603                  
0004.12        descripcio = pdescripcio;                                                                    220606                  
0004.13        precio = pprecio;                                                                            220603                  
0004.14        cantidad = pcantidad;                                                                        220603                  
0004.15        estado = 0;                                                                                  220603                  
0004.16        write rproductos;                                                                            220603                  
0004.17        Exsr registroBitacora;                                                                       220607                  
0004.18        Exsr limpiar;                                                                                220603                  
0004.19     Endif;                                                                                          220603                  
0004.20     Exfmt panta01;                                                                                  220603                  
0004.21    Enddo;                                                                                           220603                  
0004.22    *Inlr = *On;                                                                                     220603                  
0004.23                                                                                                     220603                  
0004.24    Begsr inicializar;                                                                               220603                  
0004.25      *in03 = '0';                                                                                   220603                  
0004.26      *in04 = '0';                                                                                   220603                  
0004.27      *in20 = '0';                                                                                   220603                  
0004.28      *in21 = '0';                                                                                   220603                  
0004.29      *in22 = '1';                                                                                   220603                  
0004.30      *in30 = '1';                                                                                   220603                  
0004.31    Endsr;                                                                                           220603                  
0004.32                                                                                                     220603                  
0004.33    Begsr limpiar;                                                                                   220603                  
0004.34      pcodproduct = 0;                                                                               220603                  
0004.35      pidmarca = 0;                                                                                  220603                  
0004.36      pnommarca = ' ';                                                                               220603                  
0004.37      pnombre = ' ';                                                                                 220603                  
0004.38      pdescripcio = ' ';                                                                             220603                  
0004.39      pcantidad = 0;                                                                                 220603                  
0004.40      pprecio = 0;                                                                                   220603                  
0004.41      *in30 = '1';                                                                                   220603                  
0004.42      *in21 = '0';                                                                                   220603                  
0004.43      *in22 = '0';                                                                                   220603                  
0004.44   Endsr;                                                                                            220603                  
0004.45                                                                                                     220603                  
0004.46    Begsr genIdProducto;                                                                             220603                  
0004.47      auxiProducto = 0;                                                                              220603                  
0004.48      Setll *Start productos;                                                                        220603                  
0004.49      Dow Not %EOF(productos);                                                                       220603                            
0004.50        auxiProducto += 1;                                                                           220603                  
0004.51        Read rproductos;                                                                             220603                  
0004.52      Enddo;                                                                                         220603                  
0004.53      pcodproduct = auxiProducto;                                                                    220603                  
0004.54      *in30 = '1';                                                                                   220606                  
0004.55      *in21 = '0';                                                                                   220606                  
0004.56    Endsr;                                                                                           220603                  
0004.57                                                                                                     220603                  
0004.58    Begsr consultaMarca;                                                                             220603                  
0004.68        If pidmarca > 0;                                                                             220606                  
0004.69          Chain pidmarca rmarcas;                                                                    220606                  
0004.70          If %found(marcas);                                                                         220606                  
0004.71            If mEstado = 0;                                                                          220613                  
0004.72              pnommarca = mnombre;                                                                   220613                  
0004.73              *in30 = '0';                                                                           220613                  
0004.74              *in21 = '1';                                                                           220613                  
0004.75            EndIf;                                                                                   220613                  
0004.76          EndIf;                                                                                     220606                  
0004.77        EndIf;                                                                                       220606                  
0004.78        Exfmt panta01;                                                                               220606                             
0004.79   Endsr;                                                                                            220603                  
0004.81                                                                                                     220607                  
0004.82   Begsr registroBitacora;                                                                           220607                  
0004.83     bidBitacora = auxiBitacora;                                                                     220607                  
0004.84     bidLogin = auxiLogin;                                                                           220607                  
0004.85     bidTarea = 3;                                                                                   220607                  
0004.86     bFecha = %date;                                                                                 220607                  
0004.87     bHora = %time;                                                                                  220607                  
0004.88     Write rbitacora;                                                                                220607                  
0004.89   Endsr;                                                                                            220607                  
0004.90                                                                                                     220603                  
0005.00  /end-free                                                                                          220603                  
0006.00                                                                                                     220603                  
        ****************** End of data ******************************************************************************************                                                                                                                    
                                                                                                                                    
 F3=Exit   F4=Prompt   F5=Refresh   F9=Retrieve   F10=Cursor   F11=Toggle                                                           
 F16=Repeat find       F17=Repeat change          F24=More keys                                                                     
                                                                                                                                                                                                                                                                                                                                      
                                                                                                                                                                                     
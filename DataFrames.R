
# Script Auxiliar para Gerar os Arquivos em CSV e deixar o código mais limpo

df_01_a_01 <- data.frame(Vendas_Cafe = c(18, 20, 23, 23, 23, 23, 24, 25, 26, 26, 26, 26, 27, 28, 28,29, 29, 30, 30, 31, 31, 33, 34, 35, 38, 39, 41, 44, 44, 46),
  Preco_Cafe = c(4.77, 4.67, 4.75, 4.74, 4.63, 4.56, 4.59, 4.75, 4.75,4.49,4.41,4.32, 4.68, 4.66, 4.42, 4.71, 4.66, 4.46, 4.36, 4.47,4.43,4.4, 4.61, 4.09, 3.73,3.89, 4.35, 3.84, 3.81, 3.79),
  Promocao = c("Nao", "Nao", "Nao", "Nao", "Nao", "Nao", "Nao","Nao", "Sim","Nao", "Sim", "Nao", "Nao", "Sim", "Sim", "Nao", "Sim","Sim","Sim", "Nao", "Nao", "Sim","Sim", "Sim", "Nao", "Sim","Sim","Sim", "Sim", "Sim"),
  Preco_Leite = c(4.74, 4.81, 4.36, 4.29, 4.17, 4.66, 4.73, 4.11, 4.21,4.25,4.62,4.53, 4.44, 4.19, 4.37, 4.29, 4.57, 4.21, 4.77, 4,4.31,4.34, 4.05, 4.73, 4.07,4.75, 4, 4.15, 4.34, 4.15) )

readr::write_csv(df_01_a_01, "df_01_a_01.csv")


###

df_02_a_04 <- data.frame(Cliente = c("Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto", "Adulto", "Adulto", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto_com_Crianca", "Adulto", "Adulto", "Adulto", "Adulto",
              "Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto_com_Crianca", "Adulto", "Adulto_com_Crianca", "Adulto",
              "Adulto", "Adulto_com_Crianca", "Adulto_com_Crianca", "Adulto_com_Crianca",
              "Adulto", "Adulto_com_Crianca", "Adulto", "Adulto", "Adulto",
              "Adulto","Adulto","Adulto","Adulto","Adulto","Adulto"),
  Comprou = c("Não_Comprou", "Não_Comprou", "Não_Comprou", "Não_Comprou",
              "Não_Comprou", "Não_Comprou", "Comprou", "Comprou", "Comprou",
              "Comprou", "Comprou", "Comprou", "Comprou", "Comprou", "Comprou",
              "Comprou", "Comprou", "Comprou", "Comprou", "Comprou", "Comprou","Comprou", "Comprou", "Comprou", "Não_Comprou", "Não_Comprou",
              "Não_Comprou", "Não_Comprou", "Comprou", "Não_Comprou", "Comprou",
              "Comprou", "Não_Comprou", "Não_Comprou", "Não_Comprou", "Não_Comprou",
              "Não_Comprou", "Comprou", "Comprou", "Não_Comprou", "Não_Comprou",
              "Não_Comprou", "Não_Comprou", "Não_Comprou", "Comprou","Comprou","Comprou",
              "Comprou","Comprou","Comprou"))

readr::write_csv(df_02_a_04, "data/df_02_a_04.csv")

###

df_03_a_04 <- data.frame(Gastos = c(174.770021661909, 161.329206619394,
                                    153.679900850863, 175.351592994046,
                                    185.793398289321, 170.202462740626,
                                    150.8549565713, 157.440088617225,
                                    171.596654773339, 9.87474262516482,
                                    50.5645554670016, 25.0875496696788,
                                    17.0661987504312, 60.1224674502026,
                                    35.5154028285664, 30.4321086925016,
                                    27.8188980544904, 48.0452539322412,
                                    78.9197865324734, 39.5751781629677,
                                    37.1329656327517, 38.684069121093,
                                    163.790338797433,
                                    184.720273514352, 167.583106239899,
                                    138.885665257324, 14.2586307887884,
                                    41.3867417301938, 23.7622285692359, 37.4729772794009, 42.4926762466659, 15.8016718071775,
                                    141.363480335882, 163.400459287948, 140.190492201897, 147.942698809323,
                                    8.5061846804934, 20.8113941426179, 34.6086119259266, 30.7229538650678, 8.81227865272712, 5.74735216885902,
                                    30.9398891106907, 19.6212096123791,
                                    16.716945267481, 32.9436217626275,
                                    21.511905851158, 34.6304034101472,
                                    16.2704826042681, 15.4790632095655,
                                    8.25633422881043, 4.7263338963663,
                                    14.4153129255327, 19.8344282661234,
                                    8.81306901471397, 16.7592556127806,
                                    20.3176176298076, 47.8590627884627,
                                    2.59778754862417, 9.38425601777391,
                                    25.2455048267186, 32.7250288712979,
                                    5.43268078364765, 28.2104605365607,
                                    3.18609515001209, 50.564581262513,
                                    34.7370783113952, 24.4037922212213, 31.4997283634204,
                                    11.2323425300881, 27.9053307974433, 41.2234268777169, 19.5112436004646, 31.2073058210955, 35.9470130480825,
                                    16.1960287769175, 44.5365791890593, 14.3698142789208,
                                    13.2630510987537, 4.63398786180773, 26.6610570873775,
                                    18.023244405391, 72.3298402892867, 50.5684226296565, 55.6251926080436, 17.0613250010048, 2.39404093355522,
                                    43.530118783298, 32.9831443965413, 39.9617218607622,10.4634451365926, 8.93702642184252,
                                    12.1501174131844, 11.7525513477354,
                                    16.2990775324815, 44.5453919973285,
                                    38.0393535792355, 22.0703974352325,
                                    50.7486034030794, 19.9252025339318,
                                    6.8366108202567, 3.077799353254,
                                    28.0507001837521, 30.1697285113061,
                                    6.53184416916073, 9.53198727121377,
                                    6.59266645551752, 22.1605754480815,
                                    5.90830712162365, 37.2034845899045,
                                    36.4842442182048, 22.2552757873296, 24.4627568806115,
                                    32.1985589022666, 18.604230207709, 27.5834177510951,
                                    33.0042729903, 7.53469171526227,
                                    19.8423174628847, 54.3457453874529,
                                    13.1330189654278, 15.1407470062459, 2.87916580644454,
                                    0.357075783631849, 5.83122133978906, 41.9303025963975, 50.7366690908169, 5.49225229796712,
                                    0.781567028951091, 33.3341495203441),
Estado_Civil = c("solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "solteiros", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Casados", "Casados", "Casados", "Casados", "Casados", "Casados",
                    "Divorciados", "Divorciados", "Divorciados", "Divorciados", "Divorciados",
                    "Divorciados", "Divorciados", "Divorciados", "Divorciados", "Divorciados",
                    "Divorciados", "Divorciados", "Divorciados", "Divorciados", "Divorciados"))

readr::write_csv(df_03_a_04, "data/df_03_a_04.csv")


###


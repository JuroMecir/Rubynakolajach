**DBS 2019**

**Zadanie:** Vo vami zvolenom prostredí vytvorte databázovú aplikáciu, ktorá komplexne rieši päť vami zadefinovaných scenárov
 (prípadov použitia) vo vami zvolenej doméne tak, aby ste demonštrovali využitie relačnej databázy podľa pokynov uvedených
  nižšie. Presný rozsah a konkretizáciu scenárov si dohodnete s Vašim cvičiacim na cvičení. Projekt sa rieši vo dvojiciach,
   pričom sa očakáva, že na synchronizáciu práce so spolužiakom / spolužiačkou použijete git.
   
 **Fisherman's friend**: Webová aplikácia, slúžiaca rybárom na zaznamenávanie úlovkov. Následne z týchto údajov vie aplikácia 
 odporučiť najlepšie miesta na chytanie daných druhov  rýb, najlepšiu návnadu alebo osádku daného revíru.
 
 **Scenáre:**
 
 + _1.scenár:_ Insert: Pridanie záznamu. Tento scenár sa vyskytuje viacej krát. Napríklad pri vytvorení účtu alebo pridaní úlovku.
 
+ _2.scenár:_ Show: Zobrazenie záznamu. Používateľ môže prezerať úlovky ostatných a profily ostatných používateľov.
 
 + _3.scenár:_ Delete: Zmazanie záznamu. Používateľ má možnosť vymazať záznam o svojom úlovku a vymazať svoj účet. Ak vymaže
 svoj účet, budú vymazané aj všetky jeho úlovky (riešené pomocou transakcie). 
 
 + _4.scenár:_ Edit: Používateľ má možnosť zmeniť si všetky údaje o svojom účte.
 
 + _5.scenár:_ Search: Vyhľadanie informácií. Používateľ má možnosť vyhľadať si ostatných používateľov. 
 
 Projekt je napísaný v programovacom jazyku Ruby s použitím frameworku Rails.
 
 Použitá databáza: Postgresql
 
 Pristup a napojenie na databázu je vyriešené v _database.yml_.
 
 **Využite relačnej databázy:**
 
 + GROUP BY, JOIN, Agregačná funkcia (COUNT) - Sú použité na vytváranie tabuliek. 
 
 + Transakcia - Väčšinu transkakcií si ruby rieši sám, no jednu transakciu som urobil navyše. Využíva sa pri zrušení účtu,
  kde pri zrušení účtu sú z databázy taktiež odstránené používateľove záznamy.
  
  
**Fyzický dátový model**
<img src="D:\VOS\app\assets\images\Model_db.jpg">
![](app\assets\images\Model_db.jpg?raw=truw)
 
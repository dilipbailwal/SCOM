- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -         ( c )   C o p y r i g h t   2 0 0 5 - 2 0 0 6 ,   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d         - -  
 - -         P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                     - -  
 - -                                                                                                                                                       - -  
 - -         F i l e :   U s e r R o l e A l t e r T a b l e s . s q l                                                                                     - -  
 - -                                                                                                                                                       - -  
 - -         C o n t e n t s :   T h i s   f i l e   c o n t a i n s   p e r f o r m s   o p e r a t i o n s   i n   t h e   U s e r R o l e               - -  
 - -                             r e l a t e d   t a b l e s   t h a t   n e e d   t o   h a p p e n   p o s t   M P   I m p o r t                         - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 - -  
 - -   W e   a r e   a d d i n g   t h e s e   F K s   n o w   b e c a u s e   a t   S e t u p   t i m e   w e   n e e d e d   t o   h a v e  
 - -   S c o p e s   o f   T y p e s   a n d   G r o u p s   a n d   V i e w s   t h a t   w o u l d   o n l y   b e   p r e s e n t   a f t e r   M P    
 - -   I m p o r t  
 - -  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . T A B L E S   W H E R E   T A B L E _ N A M E   =   ' U s e r R o l e V i e w ' )    
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ U s e r R o l e V i e w _ V i e w I d ' )  
 A L T E R   T A B L E   [ d b o ] . [ U s e r R o l e V i e w ]    
         A D D   C O N S T R A I N T   [ F K _ U s e r R o l e V i e w _ V i e w I d ]   F O R E I G N   K E Y   ( V i e w I d )    
         R E F E R E N C E S   [ d b o ] . [ V i e w s ] ( V i e w I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . T A B L E S   W H E R E   T A B L E _ N A M E   =   ' U s e r R o l e G r o u p T y p e ' )    
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ U s e r R o l e G r o u p T y p e _ G r o u p I d ' )  
 A L T E R   T A B L E   [ d b o ] . [ U s e r R o l e G r o u p T y p e ]    
         A D D   C O N S T R A I N T   [ F K _ U s e r R o l e G r o u p T y p e _ G r o u p I d ]   F O R E I G N   K E Y   ( G r o u p I d )    
         R E F E R E N C E S   [ d b o ] . [ B a s e M a n a g e d E n t i t y ] ( B a s e M a n a g e d E n t i t y I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . T A B L E S   W H E R E   T A B L E _ N A M E   =   ' U s e r R o l e G r o u p T y p e ' )    
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ U s e r R o l e G r o u p T y p e _ T y p e I d ' )  
 A L T E R   T A B L E   [ d b o ] . [ U s e r R o l e G r o u p T y p e ]    
         A D D   C O N S T R A I N T   [ F K _ U s e r R o l e G r o u p T y p e _ T y p e I d ]   F O R E I G N   K E Y   ( T y p e I d )    
         R E F E R E N C E S   [ d b o ] . [ M a n a g e d T y p e ] ( M a n a g e d T y p e I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . T A B L E S   W H E R E   T A B L E _ N A M E   =   ' U s e r R o l e G r o u p T y p e ' )    
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ U s e r R o l e G r o u p T y p e _ P r o p e r t y I d ' )  
 A L T E R   T A B L E   [ d b o ] . [ U s e r R o l e G r o u p T y p e ]    
         A D D   C O N S T R A I N T   [ F K _ U s e r R o l e G r o u p T y p e _ P r o p e r t y I d ]   F O R E I G N   K E Y   ( P r o p e r t y I d )    
         R E F E R E N C E S   [ d b o ] . [ M a n a g e d T y p e P r o p e r t y ] ( M a n a g e d T y p e P r o p e r t y I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' P r o f i l e ' )  
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ P r o f i l e _ R e l a t i o n s h i p T y p e I d ' )  
         A L T E R   T A B L E   [ d b o ] . [ P r o f i l e ]  
                 A D D   C O N S T R A I N T   [ F K _ P r o f i l e _ R e l a t i o n s h i p T y p e I d ]   F O R E I G N   K E Y   ( R e l a t i o n s h i p T y p e I d )  
                 R E F E R E N C E S   [ d b o ] . [ R e l a t i o n s h i p T y p e ] ( R e l a t i o n s h i p T y p e I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' P r o f i l e O p e r a t i o n I m p l i c i t S c o p e ' )  
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e _ T y p e I d ' )  
         A L T E R   T A B L E   [ d b o ] . [ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e ]   W I T H   N O C H E C K  
                 A D D   C O N S T R A I N T   [ F K _ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e _ T y p e I d ]   F O R E I G N   K E Y   ( T y p e I d )  
                 R E F E R E N C E S   [ d b o ] . [ M a n a g e d T y p e ] ( M a n a g e d T y p e I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' P r o f i l e O p e r a t i o n I m p l i c i t S c o p e ' )  
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e _ P r o p e r t y I d ' )  
         A L T E R   T A B L E   [ d b o ] . [ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e ]     W I T H   N O C H E C K  
                 A D D   C O N S T R A I N T   [ F K _ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e _ P r o p e r t y I d ]   F O R E I G N   K E Y   ( P r o p e r t y I d )  
                 R E F E R E N C E S   [ d b o ] . [ M a n a g e d T y p e P r o p e r t y ] ( M a n a g e d T y p e P r o p e r t y I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' P r o f i l e O p e r a t i o n I m p l i c i t S c o p e ' )  
 A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R E F E R E N T I A L _ C O N S T R A I N T S    
                                 W H E R E   C O N S T R A I N T _ N A M E   =   ' F K _ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e _ R e l a t i o n s h i p T y p e I d ' )  
         A L T E R   T A B L E   [ d b o ] . [ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e ]     W I T H   N O C H E C K  
                 A D D   C O N S T R A I N T   [ F K _ P r o f i l e O p e r a t i o n I m p l i c i t S c o p e _ R e l a t i o n s h i p T y p e I d ]   F O R E I G N   K E Y   ( R e l a t i o n s h i p T y p e I d )  
                 R E F E R E N C E S   [ d b o ] . [ R e l a t i o n s h i p T y p e ] ( R e l a t i o n s h i p T y p e I d )   O N   D E L E T E   C A S C A D E  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -         ( c )   C o p y r i g h t   2 0 0 5 - 2 0 0 6 ,   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d         - -  
 - -         P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                     - -  
 - -                                                                                                                                                       - -  
 - -         F i l e :   A E M T a b l e s . s q l                                                                                                         - -  
 - -                                                                                                                                                       - -  
 - -         C o n t e n t s :   T h i s   f i l e   c o n t a i n s   t h e   d e f i n i t i o n   o f   t a b l e s   f o r                             - -  
 - -                             A p p l i c a t i o n   E x c e p t i o n   M o n i t o r i n g   m o d u l e s .                                           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' A e m R e l a t i o n s h i p '    
                                 A N D   C O L U M N _ N A M E   =   N ' E n t i t y T y p e I d ' )  
 B E G I N  
         U P D A T E   [ d b o ] . [ A e m R e l a t i o n s h i p ]  
                 S E T   [ E n t i t y T y p e I d ]   =   0  
                 W H E R E   [ E n t i t y T y p e I d ]   =   - 1   A N D    
                         [ S o u r c e E n t i t y I d ]   i n   ( S E L E C T   [ B a s e M a n a g e d E n t i t y I d ]   F R O M   [ d b o ] . [ M T _ A p p l i c a t i o n ] )  
  
         U P D A T E   [ d b o ] . [ A e m R e l a t i o n s h i p ]  
                 S E T   [ E n t i t y T y p e I d ]   =   1  
                 W H E R E   [ E n t i t y T y p e I d ]   =   - 1   A N D    
                         [ S o u r c e E n t i t y I d ]   n o t   i n   ( S E L E C T   [ B a s e M a n a g e d E n t i t y I d ]   F R O M   [ d b o ] . [ M T _ A p p l i c a t i o n ] )  
 E N D  
 G O  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -         ( c )   C o p y r i g h t   2 0 0 5 - 2 0 0 6 ,   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d         - -  
 - -         P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                     - -  
 - -                                                                                                                                                       - -  
 - -         F i l e :   A E M S p r o c s . s q l                                                                                                         - -  
 - -                                                                                                                                                       - -  
 - -         C o n t e n t s :   T h i s   f i l e   c o n t a i n s   t h e   s t o r e d   p r o c e d u r e s   t h a t   s u p p o r t   t h e         - -  
 - -                         A p p l i c a t i o n   E x c e p t i o n   M o n i t o r i n g   ( A E M )   p r o c e s s                                   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -  
 - -   S p r o c   N a m e :   p _ A e m G e t R e s p o n s e T y p e s  
 - -   D e s c r i p t i o n :   F i g u r e s   o u t   w h a t   t y p e   o f   s o l u t i o n   r e s p o n s e   a n d   c o l l e c t i o n   r e s p o n s e   i s   a c t i v e   ( M S / C u s t o m / N o n e )  
 - -   C a l l e r :   A E M   F i l l e r   M o d u l e  
 - -  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ A e m G e t R e s p o n s e T y p e s ' )  
         D R O P   P R O C E D U R E   d b o . p _ A e m G e t R e s p o n s e T y p e s  
 G O  
  
 C R E A T E   P R O C E D U R E   d b o . [ p _ A e m G e t R e s p o n s e T y p e s ]  
 (  
         @ B a s e M a n a g e d E n t i t y I d                                 u n i q u e i d e n t i f i e r ,  
         @ S e l e c t e d C o l l e c t i o n R e s p o n s e T y p e           n v a r c h a r ( 2 5 5 )   O U T P U T ,  
         @ S e l e c t e d S o l u t i o n R e s p o n s e T y p e               n v a r c h a r ( 2 5 5 )   O U T P U T  
 )  
 A S  
 B E G I N  
         S E T   N O C O U N T   O N  
  
         S E L E C T    
                 @ S e l e c t e d C o l l e c t i o n R e s p o n s e T y p e   =   [ S e l e c t e d C o l l e c t i o n R e s p o n s e T y p e ] ,  
                 @ S e l e c t e d S o l u t i o n R e s p o n s e T y p e   =   [ S e l e c t e d S o l u t i o n R e s p o n s e T y p e ]  
         F R O M  
                 d b o . [ M T _ W a t s o n B u c k e t ]  
         W H E R E  
                 [ B a s e M a n a g e d E n t i t y I d ]   =   @ B a s e M a n a g e d E n t i t y I d  
 E N D  
 G O    
  
 - -  
 - -   S p r o c   N a m e :   p _ A e m G e t M a p p i n g s  
 - -   D e s c r i p t i o n :   R e t u r n s   t h e   p a r a m e t e r   # s   u s e d   t o   f i n d   a p p N a m e   a n d   a p p V e r   f o r   g i v e n   b u c k e t  
 - -   C a l l e r :   A E M   F i l l e r   M o d u l e  
 - -  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ A e m G e t M a p p i n g s ' )  
         D R O P   P R O C E D U R E   d b o . p _ A e m G e t M a p p i n g s  
 G O  
  
 C R E A T E   P R O C E D U R E   d b o . [ p _ A e m G e t M a p p i n g s ]  
 (  
         @ B u c k e t T y p e                                                   n v a r c h a r ( 2 5 5 ) ,  
         @ E v e n t T y p e                                                     n v a r c h a r ( 2 5 5 ) ,  
         @ A p p N a m e P a r a m e t e r N u m b e r                           i n t   O U T P U T ,  
         @ A p p V e r P a r a m e t e r N u m b e r                             i n t   O U T P U T  
 )  
 A S  
 B E G I N  
         S E T   N O C O U N T   O N  
  
         - -   t h i s   s e l e c t   s t a t e m e n t   r e s u l t S e t   i s   r e t u r n e d ,   i f   t h e   n e x t   s e l e c t   i s   e m p t y  
         S E L E C T    
                 @ A p p N a m e P a r a m e t e r N u m b e r   =   1 2 ,  
                 @ A p p V e r P a r a m e t e r N u m b e r   =   1 2  
  
         S E L E C T    
                 @ A p p N a m e P a r a m e t e r N u m b e r   =   [ A p p l i c a t i o n N a m e P a r a m e t e r N u m b e r ] ,  
                 @ A p p V e r P a r a m e t e r N u m b e r   =   [ A p p l i c a t i o n V e r s i o n P a r a m e t e r N u m b e r ]  
         F R O M  
                 d b o . [ M T _ M a p p e r T y p e ]  
         W H E R E  
                 [ B u c k e t T y p e ]   =   @ B u c k e t T y p e   A N D   [ E v e n t T y p e ]   =   @ E v e n t T y p e  
 E N D  
 G O    
  
 - -  
 - -   S p r o c   N a m e :   p _ A e m G e t S y s t e m B u c k e t I n f o  
 - -   D e s c r i p t i o n :   G e t s   M a c h i n e   N a m e   f o r   a l l   s y s t e m   b u c k e t s  
 - -   C a l l e r :   O l e D b   t h r o u g h   r u l e s :   ( 1 )   M i c r o s o f t . S y s t e m C e n t e r . C M . A E M . I n t e r n a l . S y s t e m B u c k e t T o t a l H i t C o u n t M o n i t o r S u c c e s s S t a t e S e t t e r    
 - -                                                     a n d   ( 2 )   M i c r o s o f t . S y s t e m C e n t e r . C M . A E M . I n t e r n a l . S y s t e m B u c k e t T o t a l H i t C o u n t M o n i t o r E r r o r S t a t e S e t t e r  
 - -  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ A e m G e t S y s t e m B u c k e t I n f o ' )  
         D R O P   P R O C E D U R E   d b o . p _ A e m G e t S y s t e m B u c k e t I n f o  
 G O  
  
 C R E A T E   P R O C E D U R E   p _ A e m G e t S y s t e m B u c k e t I n f o  
 A S  
 B E G I N  
         - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
         - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
         S E T   N O C O U N T   O N ;  
  
         D E C L A R E   @ C o l u m n N a m e   n v a r c h a r ( 2 5 6 ) ,   @ T a b l e N a m e   n v a r c h a r ( 2 5 6 )  
         S E T   @ C o l u m n N a m e   =   N U L L  
         S E T   @ T a b l e N a m e   =   N U L L  
  
         S E L E C T   @ C o l u m n N a m e   =   m t p . C o l u m n N a m e    
         F R O M   M a n a g e d T y p e P r o p e r t y   m t p  
             J O I N   M a n a g e d T y p e   m t   O N   m t . M a n a g e d T y p e I d   =   m t p . M a n a g e d T y p e I d  
             J O I N   M a n a g e m e n t P a c k   m p   O N   m t . M a n a g e m e n t P a c k I d   =   m p . M a n a g e m e n t P a c k I d  
         W H E R E   m p . M P N a m e   =   ' M i c r o s o f t . S y s t e m C e n t e r . C l i e n t M o n i t o r i n g . L i b r a r y '  
             A N D   m t . T y p e N a m e   =   ' M i c r o s o f t . S y s t e m C e n t e r . C M . A E M . S y s t e m B u c k e t '  
             A N D   m t p . M a n a g e d T y p e P r o p e r t y N a m e   =   ' M a c h i n e N a m e '  
              
         S E L E C T   @ T a b l e N a m e   =   M a n a g e d T y p e T a b l e N a m e    
         F R O M   M a n a g e d T y p e    
         W H E R E   T y p e N a m e   =   ' M i c r o s o f t . S y s t e m C e n t e r . C M . A E M . S y s t e m B u c k e t '  
  
         I F   ( @ C o l u m n N a m e   I S   N U L L )  
         B E G I N  
                 R E T U R N   1  
         E N D  
  
         S E T   @ C o l u m n N a m e   =   ' S B . '   +   @ C o l u m n N a m e  
  
         E X E C (  
                 '   S E L E C T   S U M ( A C . H i t C o u n t ) ,   A C . S o u r c e E n t i t y I d ,   1 ,   '   +   @ C o l u m n N a m e    
             +   '   F R O M   A e m C r a s h C o u n t e r s   A C   J O I N   '   +   @ T a b l e N a m e   +   '   S B   O N   A C . S o u r c e E n t i t y I d   =   S B . B a s e M a n a g e d E n t i t y I d '  
             +   '   W H E R E   A C . E n t i t y T y p e I d   =   1   G R O U P   B Y   A C . S o u r c e E n t i t y I d ,   '   +   @ C o l u m n N a m e  
         )  
  
         R E T U R N   0  
 E N D  
 G O  
  
  
 d e c l a r e   @ M a n a g e d T y p e I d   u n i q u e i d e n t i f i e r  
 s e l e c t   @ M a n a g e d T y p e I d   =   M a n a g e d T y p e I d   F R O M   M a n a g e d T y p e   w h e r e   T y p e N a m e   =   N ' S y s t e m . K n o w l e d g e . A r t i c l e '  
  
 i f   @ M a n a g e d T y p e I d   I S   N O T   N U L L  
 	 e x e c   d b o . p _ C r e a t e F u l l T e x t I n d e x F o r T y p e   @ M a n a g e d T y p e I d  
  
 g o  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d           - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                     - -  
 - -                                                                                                                                                   - -  
 - -     F i l e :               O M S p e c i f i c D a t a . s q l                                                                                   - -  
 - -                                                                                                                                                   - -  
 - -     T h i s   i s   a n   a u t o g e n e r a t e d   f i l e ,   g e n e r a t e d   b y   t h e   g e n e r a t o r   p r o g r a m .           - -  
 - -     D o   n o t   d i r e c t l y   e d i t   t h i s   f i l e   a s   t h e   c h a n g e s   c a n   b e   l o s t .                           - -  
 - -                                                                                                                                                   - -  
 - -     C o n t e n t s :   O M   D a t a ;   t o   b e   r u n   p o s t   M P   i m p o r t .                                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   R e s o l u t i o n   s t a t e s  
 d e c l a r e   @ l o c a l i z e d _ s t r i n g _ R e s o l u t i o n S t a t e 1   n v a r c h a r ( 5 0 )  
 s e t   @ l o c a l i z e d _ s t r i n g _ R e s o l u t i o n S t a t e 1 = N ' N e w '  
 U P D A T E   [ d b o ] . [ R e s o l u t i o n S t a t e ]  
         - -   l o c a l i z e d   S t a t e  
         S E T   [ R e s o l u t i o n S t a t e N a m e ]   =   @ l o c a l i z e d _ s t r i n g _ R e s o l u t i o n S t a t e 1  
         W H E R E   [ R e s o l u t i o n S t a t e ]   =   0  
 G O  
  
 d e c l a r e   @ l o c a l i z e d _ s t r i n g _ R e s o l u t i o n S t a t e 2   n v a r c h a r ( 5 0 )  
 s e t   @ l o c a l i z e d _ s t r i n g _ R e s o l u t i o n S t a t e 2 = N ' C l o s e d '  
 U P D A T E   [ d b o ] . [ R e s o l u t i o n S t a t e ]  
         - -   l o c a l i z e d   S t a t e  
         S E T   [ R e s o l u t i o n S t a t e N a m e ]   =   @ l o c a l i z e d _ s t r i n g _ R e s o l u t i o n S t a t e 2  
         W H E R E   [ R e s o l u t i o n S t a t e ]   =   2 5 5  
 G O  
  
 
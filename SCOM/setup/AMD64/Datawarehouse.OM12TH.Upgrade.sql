- - * *   O M 1 2   T H   D W   u p g r a d e   s c r i p t    
    
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s . i n d e x e s   W H E R E   n a m e   =   ' I X _ M a n a g e d E n t i t y T y p e M a n a g e m e n t P a c k V e r s i o n _ B a s e M a n a g e d E n t i t y T y p e R o w I d ' )  
 B E G I N  
     C R E A T E   I N D E X   I X _ M a n a g e d E n t i t y T y p e M a n a g e m e n t P a c k V e r s i o n _ B a s e M a n a g e d E n t i t y T y p e R o w I d   O N   M a n a g e d E n t i t y T y p e M a n a g e m e n t P a c k V e r s i o n   ( B a s e M a n a g e d E n t i t y T y p e R o w I d )  
 E N D  
 G O  
 A L T E R   T A B L E   d b o . R e l a t i o n s h i p S t a g e  
         D R O P   C O L U M N   I n s e r t R e a d y I n d  
 A L T E R   T A B L E   d b o . R e l a t i o n s h i p S t a g e  
         A D D   I n s e r t R e a d y I n d   A S   ( C A S E   W H E N   D i s c o v e r e d I n d   =   0   T H E N   D e l e t e P r o c e s s e d I n d   E L S E   ( C A S E   W H E N   ( R e l a t i o n s h i p T y p e R o w I d   I S   N U L L   O R   S o u r c e M a n a g e d E n t i t y R o w I d   I S   N U L L   O R   T a r g e t M a n a g e d E n t i t y R o w I d   I S   N U L L )   T H E N   0   E L S E   1   E N D )   E N D )  
 G O  
   I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s o b j e c t s   W H E R E   t y p e   =   ' P '   A N D   n a m e   =   ' P e r f o r m a n c e A g g r e g a t e ' )  
 	 B E G I N  
 	 	 E X E C U T E   ( ' C R E A T E   P R O C E D U R E   d b o . P e r f o r m a n c e A g g r e g a t e   A S   R E T U R N   1 ' )  
 	 E N D  
 G O  
  
 A L T E R   P R O C E D U R E   d b o . P e r f o r m a n c e A g g r e g a t e  
       @ D a t a s e t I d       u n i q u e i d e n t i f i e r  
     , @ A g g r e g a t i o n T y p e I d   i n t  
     , @ I n s e r t T a b l e G u i d   v a r c h a r ( 2 5 6 )  
     , @ I n t e r v a l S t a r t D a t e T i m e   d a t e t i m e  
     , @ I n t e r v a l E n d D a t e T i m e   d a t e t i m e  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
  
     D E C L A R E    
           @ E r r o r I n d                 b i t  
         , @ E r r o r M e s s a g e         n v a r c h a r ( 4 0 0 0 )  
         , @ E r r o r N u m b e r           i n t  
         , @ E r r o r S e v e r i t y       i n t  
         , @ E r r o r S t a t e             i n t  
         , @ E r r o r L i n e               i n t  
         , @ E r r o r P r o c e d u r e     n v a r c h a r ( 2 5 6 )  
         , @ E r r o r M e s s a g e T e x t   n v a r c h a r ( 4 0 0 0 )  
  
     S E T   @ E r r o r I n d   =   0  
      
     B E G I N   T R Y  
         D E C L A R E  
               @ S t a t e m e n t   n v a r c h a r ( m a x )  
             , @ D e b u g L e v e l   t i n y i n t  
             , @ I n s e r t T a b l e N a m e   s y s n a m e  
             , @ D e b u g M e s s a g e   n v a r c h a r ( m a x )  
             , @ A g g r e g a t i o n S t a r t D a t e T i m e   d a t e t i m e  
             , @ C o v e r V i e w N a m e   s y s n a m e  
             , @ S c h e m a N a m e   s y s n a m e  
              
         S E L E C T  
               @ D e b u g L e v e l   =   D e b u g L e v e l  
             , @ S c h e m a N a m e   =   S c h e m a N a m e  
         F R O M   S t a n d a r d D a t a s e t  
         W H E R E   D a t a s e t I d   =   @ D a t a s e t I d  
          
         S E L E C T   @ C o v e r V i e w N a m e   =   ' v '   +   B a s e T a b l e N a m e  
         F R O M   S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e  
         W H E R E   ( D a t a s e t I d   =   @ D a t a s e t I d )  
             A N D   ( A g g r e g a t i o n T y p e I d   =   0 )  
             A N D   ( D e p e n d e n t T a b l e I n d   =   0 )  
              
         S E L E C T   @ I n s e r t T a b l e N a m e   =   B a s e T a b l e N a m e   +   ' _ '   +   R E P L A C E ( C A S T ( @ I n s e r t T a b l e G u i d   A S   v a r c h a r ( 5 0 ) ) ,   ' - ' ,   ' ' )  
         F R O M   S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e  
         W H E R E   ( D a t a s e t I d   =   @ D a t a s e t I d )  
             A N D   ( A g g r e g a t i o n T y p e I d   =   @ A g g r e g a t i o n T y p e I d )  
             A N D   ( D e p e n d e n t T a b l e I n d   =   0 )  
          
         I F   ( @ D e b u g L e v e l   >   2 )  
         B E G I N  
             S E T   @ D e b u g M e s s a g e   =   ' S t a r t i n g   a g g r e g a t i o n   o f   t y p e   '   +   C A S T ( @ A g g r e g a t i o n T y p e I d   A S   v a r c h a r ( 1 0 ) )   +   '   f o r   i n t e r v a l   f r o m   '  
                                                   +   C O N V E R T ( v a r c h a r ( 2 0 ) ,   @ I n t e r v a l S t a r t D a t e T i m e ,   1 2 0 )   +   ' U T C   t o   '  
                                                   +   C O N V E R T ( v a r c h a r ( 2 0 ) ,   @ I n t e r v a l E n d D a t e T i m e ,   1 2 0 )   +   ' U T C '  
             S E T   @ A g g r e g a t i o n S t a r t D a t e T i m e   =   G E T U T C D A T E ( )  
              
             E X E C   D e b u g M e s s a g e I n s e r t  
                   @ D a t a s e t I d   =   @ D a t a s e t I d  
                 , @ M e s s a g e L e v e l   =   3  
                 , @ M e s s a g e T e x t   =   @ D e b u g M e s s a g e  
         E N D  
          
         S E T   @ S t a t e m e n t   =  
                 ' I N S E R T   '   +   Q U O T E N A M E ( @ S c h e m a N a m e )   +   ' . '   +   Q U O T E N A M E ( @ I n s e r t T a b l e N a m e )   +   '   ( '  
             +   '     [ D a t e T i m e ] '  
             +   '   , P e r f o r m a n c e R u l e I n s t a n c e R o w I d '  
             +   '   , M a n a g e d E n t i t y R o w I d '  
             +   '   , S a m p l e C o u n t '  
             +   '   , A v e r a g e V a l u e '  
             +   '   , M i n V a l u e '  
             +   '   , M a x V a l u e '  
             +   '   , S t a n d a r d D e v i a t i o n '  
             +   ' ) '  
             +   '   S E L E C T '  
             +   '         C O N V E R T ( d a t e t i m e ,   ' ' '   +   C O N V E R T ( v a r c h a r ( 5 0 ) ,   @ I n t e r v a l S t a r t D a t e T i m e ,   1 2 0 )   +   ' ' ' ,   1 2 0 ) '  
             +   '       , P e r f o r m a n c e R u l e I n s t a n c e R o w I d '  
             +   '       , M a n a g e d E n t i t y R o w I d '  
             +   '       , C O U N T ( * ) '  
             +   '       , A V G ( S a m p l e V a l u e ) '  
             +   '       , M I N ( S a m p l e V a l u e ) '  
             +   '       , M A X ( S a m p l e V a l u e ) '  
             +   '       , I S N U L L ( S T D E V ( S a m p l e V a l u e ) ,   0 ) '  
             +   '   F R O M   '   +   Q U O T E N A M E ( @ S c h e m a N a m e )   +   ' . '   +   Q U O T E N A M E ( @ C o v e r V i e w N a m e )  
             +   '   W H E R E   ( [ D a t e T i m e ]   > =   C O N V E R T ( d a t e t i m e ,   ' ' '   +   C O N V E R T ( v a r c h a r ( 5 0 ) ,   @ I n t e r v a l S t a r t D a t e T i m e ,   1 2 0 )   +   ' ' ' ,   1 2 0 ) ) '  
             +   '       A N D   ( [ D a t e T i m e ]   <   C O N V E R T ( d a t e t i m e ,   ' ' '   +   C O N V E R T ( v a r c h a r ( 5 0 ) ,   @ I n t e r v a l E n d D a t e T i m e ,   1 2 0 )   +   ' ' ' ,   1 2 0 ) ) '  
             +   '       A N D   S a m p l e V a l u e   B E T W E E N   - 1 E 1 4 5   A N D   1 E 1 4 5 '     - -   P r e v e n t   a r i t h m e t i c   o v e r f l o w   i n   S T D E V  
             +   '   G R O U P   B Y   P e r f o r m a n c e R u l e I n s t a n c e R o w I d ,   M a n a g e d E n t i t y R o w I d '  
              
         E X E C U T E   ( @ S t a t e m e n t )  
  
         I F   ( @ D e b u g L e v e l   >   2 )  
         B E G I N  
             S E T   @ D e b u g M e s s a g e   =   ' F i n i s h e d   a g g r e g a t i o n   o f   t y p e   '   +   C A S T ( @ A g g r e g a t i o n T y p e I d   A S   v a r c h a r ( 1 0 ) )   +   '   f o r   i n t e r v a l   f r o m   '  
                                                   +   C O N V E R T ( v a r c h a r ( 2 0 ) ,   @ I n t e r v a l S t a r t D a t e T i m e ,   1 2 0 )   +   ' U T C   t o   '  
                                                   +   C O N V E R T ( v a r c h a r ( 2 0 ) ,   @ I n t e r v a l E n d D a t e T i m e ,   1 2 0 )   +   ' U T C '  
              
             D E C L A R E   @ O p e r a t i o n D u r a t i o n M s   b i g i n t  
             S E T   @ O p e r a t i o n D u r a t i o n M s   =   A B S ( D A T E D I F F ( m s ,   G E T U T C D A T E ( ) ,   @ A g g r e g a t i o n S t a r t D a t e T i m e ) )  
              
             E X E C   D e b u g M e s s a g e I n s e r t  
                   @ D a t a s e t I d   =   @ D a t a s e t I d  
                 , @ M e s s a g e L e v e l   =   3  
                 , @ M e s s a g e T e x t   =   @ D e b u g M e s s a g e  
                 , @ O p e r a t i o n D u r a t i o n M s   =   @ O p e r a t i o n D u r a t i o n M s  
         E N D  
     E N D   T R Y  
     B E G I N   C A T C H  
         I F   ( @ @ T R A N C O U N T   >   0 )  
             R O L L B A C K   T R A N  
  
         S E L E C T    
               @ E r r o r N u m b e r   =   E R R O R _ N U M B E R ( )  
             , @ E r r o r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
             , @ E r r o r S t a t e   =   E R R O R _ S T A T E ( )  
             , @ E r r o r L i n e   =   E R R O R _ L I N E ( )  
             , @ E r r o r P r o c e d u r e   =   I S N U L L ( E R R O R _ P R O C E D U R E ( ) ,   ' - ' )  
             , @ E r r o r M e s s a g e T e x t   =   E R R O R _ M E S S A G E ( )  
  
         S E T   @ E r r o r I n d   =   1  
     E N D   C A T C H  
      
     - -   r e p o r t   e r r o r   i f   a n y  
     I F   ( @ E r r o r I n d   =   1 )  
     B E G I N  
         I F   ( @ D e b u g L e v e l   >   0 )  
         B E G I N  
             D E C L A R E   @ D e b u g M e s s a g e T e x t   n v a r c h a r ( m a x )  
  
             S E T   @ D e b u g M e s s a g e T e x t   =   N ' F a i l e d   t o   b u i l d   a g g r e g a t e s   f o r   p e r f o r m a n c e   d a t a   s e t .   E r r o r   '   +   C A S T ( @ E r r o r N u m b e r   A S   v a r c h a r ( 1 5 ) )  
                                             +   ' ,   P r o c e d u r e   '   +   @ E r r o r P r o c e d u r e  
                                             +   ' ,   L i n e   '   +   C A S T ( @ E r r o r L i n e   A S   v a r c h a r ( 1 5 ) )  
                                             +   ' ,   M e s s a g e :   ' +   @ E r r o r M e s s a g e T e x t  
  
             E X E C   D e b u g M e s s a g e I n s e r t  
                   @ D a t a s e t I d   =   @ D a t a s e t I d  
                 , @ M e s s a g e L e v e l   =   1  
                 , @ M e s s a g e T e x t   =   @ D e b u g M e s s a g e T e x t  
         E N D  
              
         D E C L A R E   @ A d j u s t e d E r r o r S e v e r i t y   i n t  
  
         S E T   @ A d j u s t e d E r r o r S e v e r i t y   =   C A S E  
                                                                       W H E N   @ E r r o r S e v e r i t y   >   1 8   T H E N   1 8  
                                                                       E L S E   @ E r r o r S e v e r i t y  
                                                                   E N D  
  
         R A I S E R R O R   ( 7 7 7 9 7 1 0 0 2 ,   @ A d j u s t e d E r r o r S e v e r i t y ,   1  
             , @ E r r o r N u m b e r  
             , @ E r r o r S e v e r i t y  
             , @ E r r o r S t a t e  
             , @ E r r o r P r o c e d u r e  
             , @ E r r o r L i n e  
             , @ E r r o r M e s s a g e T e x t  
         )  
     E N D  
 E N D  
 G O  
     I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   d b o . s y s o b j e c t s   W H E R E   i d   =   o b j e c t _ i d ( N ' d b o . G e t S t a t e D a i l y ' )   a n d   x t y p e   i n   ( N ' F N ' ,   N ' I F ' ,   N ' T F ' ) )  
     E X E C U T E ( ' C R E A T E   F U N C T I O N   d b o . G e t S t a t e D a i l y ( )   R E T U R N S   T A B L E   A S   R E T U R N   S E L E C T   N U L L   a s   B l a n k ' )  
 G O  
  
 A L T E R   F U N C T I O N   d b o . G e t S t a t e D a i l y  
 (  
         @ S t a r t D a t e   d a t e t i m e  
       , @ E n d D a t e   d a t e t i m e  
 )  
 R E T U R N S   T A B L E  
 A S  
 R E T U R N   (  
 W I T H   D a t e T i m e C T E  
 A S   (  
         S E L E C T  
                 D a t e T i m e ,  
                 D a t e ,  
                 T i m e ,  
                 M i n u t e  
         F R O M   v D a t e T i m e   d t   W H E R E   d t . M i n u t e   =   0    
                 A N D   d t . D a t e T i m e   > =   @ S t a r t D a t e    
                 A N D   d t . D a t e T i m e   <   @ E n d D a t e    
                 A N D   d t . [ D a t e ]   B E T W E E N   D A T E A D D ( d a y ,   - 1 ,   @ S t a r t D a t e )   A N D   D A T E A D D ( d a y ,   1 ,   @ E n d D a t e )  
 )  
 S E L E C T  
     [ D a t e T i m e ] ,  
     [ D a t e ] ,  
     [ T i m e ] ,  
     M a n a g e d E n t i t y M o n i t o r R o w I d ,  
     M a n a g e d E n t i t y R o w I d ,  
     M o n i t o r R o w I d ,  
     I n t e r v a l D u r a t i o n M i l l i s e c o n d s ,  
     I n Y e l l o w S t a t e M i l l i s e c o n d s ,  
     I n R e d S t a t e M i l l i s e c o n d s ,  
     I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,  
     I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,  
     I n D i s a b l e d S t a t e M i l l i s e c o n d s ,  
     H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s ,  
     I n W h i t e S t a t e M i l l i s e c o n d s   =  
         C A S E  
             W H E N   ( ( M a n a g e d E n t i t y M o n i t o r E x i s t e d I n d   =   0 )   O R   ( a h . A g g r e g a t i o n C o u n t   =   0 )   O R   ( D A T E A D D ( m s ,   I n t e r v a l D u r a t i o n M i l l i s e c o n d s ,   [ D a t e T i m e ] )   > =   G E T U T C D A T E ( ) ) )   T H E N   I n t e r v a l D u r a t i o n M i l l i s e c o n d s   -   I n Y e l l o w S t a t e M i l l i s e c o n d s   -   I n R e d S t a t e M i l l i s e c o n d s   -   I n D i s a b l e d S t a t e M i l l i s e c o n d s   -   I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   E L S E   0  
         E N D ,  
     I n G r e e n S t a t e M i l l i s e c o n d s   =  
         C A S E  
             W H E N   ( M a n a g e d E n t i t y M o n i t o r E x i s t e d I n d   =   1 )   A N D   ( ( a h . A g g r e g a t i o n C o u n t   >   0 )   O R   ( ( a h . A g g r e g a t i o n C o u n t   I S   N U L L )   A N D   ( D A T E A D D ( m s ,   I n t e r v a l D u r a t i o n M i l l i s e c o n d s ,   [ D a t e T i m e ] )   <   G E T U T C D A T E ( ) ) ) )   T H E N   I n t e r v a l D u r a t i o n M i l l i s e c o n d s   -   I n Y e l l o w S t a t e M i l l i s e c o n d s   -   I n R e d S t a t e M i l l i s e c o n d s   -   I n D i s a b l e d S t a t e M i l l i s e c o n d s   -   I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   E L S E   0  
         E N D  
 F R O M   ( S E L E C T  
     d t . [ D a t e T i m e ] ,  
     d t . [ D a t e ] ,  
     d t . [ T i m e ] ,  
     M a n a g e d E n t i t y M o n i t o r R o w I d   =   m e m . M a n a g e d E n t i t y M o n i t o r R o w I d ,  
     M a n a g e d E n t i t y R o w I d   =   m e m . M a n a g e d E n t i t y R o w I d ,  
     M o n i t o r R o w I d   =   m e m . M o n i t o r R o w I d ,  
     M a n a g e d E n t i t y M o n i t o r E x i s t e d I n d   =  
         C A S E  
             W H E N   m e m _ e x i s t s . M a n a g e d E n t i t y M o n i t o r R o w I d   I S   N U L L   T H E N   0   E L S E   1  
         E N D ,  
     I n t e r v a l D u r a t i o n M i l l i s e c o n d s   =   6 0   *   1 0 0 0   *   1 4 4 0 ,  
     I n Y e l l o w S t a t e M i l l i s e c o n d s   =   I S N U L L ( s . I n Y e l l o w S t a t e M i l l i s e c o n d s ,   0 ) ,  
     I n R e d S t a t e M i l l i s e c o n d s   =   I S N U L L ( s . I n R e d S t a t e M i l l i s e c o n d s ,   0 ) ,  
     I n D i s a b l e d S t a t e M i l l i s e c o n d s   =   I S N U L L ( s . I n D i s a b l e d S t a t e M i l l i s e c o n d s ,   0 ) ,  
     I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   =   I S N U L L ( s . I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,   0 ) ,  
     I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   =   I S N U L L ( s . I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,   0 ) ,  
     H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   =   I S N U L L ( s . H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s ,   0 )  
 F R O M   D a t e T i m e C T E   d t  
 C R O S S   J O I N   v M a n a g e d E n t i t y M o n i t o r   m e m  
 L E F T   J O I N   [ S t a t e ] . [ v S t a t e D a i l y ]   s  
     O N   ( ( s . [ D a t e T i m e ]   > =   d t . [ D a t e T i m e ] )   A N D   ( s . [ D a t e T i m e ]   <   D A T E A D D ( D A Y ,   1 ,   d t . [ D a t e T i m e ] ) )   A N D   ( s . M a n a g e d E n t i t y M o n i t o r R o w I d   =   m e m . M a n a g e d E n t i t y M o n i t o r R o w I d ) )  
 L E F T   J O I N   ( S E L E C T   D I S T I N C T  
     m e m 2 . M a n a g e d E n t i t y M o n i t o r R o w I d ,  
     d t 2 . [ D a t e ] ,  
     d t 2 . [ T i m e ]  
 F R O M   D a t e T i m e C T E   d t 2  
 C R O S S   J O I N   v M a n a g e d E n t i t y M o n i t o r   m e m 2  
 J O I N   v M a n a g e d E n t i t y   m e  
     O N   ( m e . M a n a g e d E n t i t y R o w I d   =   m e m 2 . M a n a g e d E n t i t y R o w I d )  
 J O I N   v M o n i t o r M a n a g e m e n t P a c k V e r s i o n   m m p v  
     O N   ( m m p v . M o n i t o r R o w I d   =   m e m 2 . M o n i t o r R o w I d )  
 J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v  
     O N   ( ( m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d )   A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   m e . M a n a g e m e n t G r o u p R o w I d )   A N D   ( d t 2 . [ D a t e T i m e ]   > =   m g m p v . I n s t a l l e d D a t e T i m e )   A N D   ( d t 2 . [ D a t e T i m e ]   <   I S N U L L ( m g m p v . D e l e t e d D a t e T i m e ,   ' 9 9 9 9 1 2 3 1 ' ) ) )  
 J O I N   v M a n a g e d E n t i t y M a n a g e m e n t G r o u p   m e m g  
     O N   ( ( m e m 2 . M a n a g e d E n t i t y R o w I d   =   m e m g . M a n a g e d E n t i t y R o w I d )   A N D   ( d t 2 . [ D a t e T i m e ]   > =   m e m g . F r o m D a t e T i m e )   A N D   ( d t 2 . [ D a t e T i m e ]   <   I S N U L L ( m e m g . T o D a t e T i m e ,   ' 9 9 9 9 1 2 3 1 ' ) ) )  
 W H E R E   ( d t 2 . M i n u t e   =   A B S ( D A T E D I F F ( M I N U T E ,   G E T U T C D A T E ( ) ,   G E T D A T E ( ) )   %   6 0 ) )   A N D   D A T E A D D ( M I N U T E ,   D A T E D I F F ( M I N U T E ,   G E T U T C D A T E ( ) ,   G E T D A T E ( ) ) ,   d t 2 . [ D a t e T i m e ] )   =   C O N V E R T ( d a t e t i m e ,   C O N V E R T ( c h a r ( 8 ) ,   D A T E A D D ( M I N U T E ,   D A T E D I F F ( M I N U T E ,   G E T U T C D A T E ( ) ,   G E T D A T E ( ) ) ,   d t 2 . [ D a t e T i m e ] ) ,   1 1 2 ) ,   1 1 2 ) )   A S   m e m _ e x i s t s  
     O N   ( m e m _ e x i s t s . M a n a g e d E n t i t y M o n i t o r R o w I d   =   m e m . M a n a g e d E n t i t y M o n i t o r R o w I d )   A N D   ( m e m _ e x i s t s . [ D a t e ]   =   d t . [ D a t e ] )   A N D   ( m e m _ e x i s t s . [ T i m e ]   =   d t . [ T i m e ] )  
 W H E R E   ( d t . M i n u t e   =   A B S ( D A T E D I F F ( M I N U T E ,   G E T U T C D A T E ( ) ,   G E T D A T E ( ) )   %   6 0 ) )   A N D   D A T E A D D ( M I N U T E ,   D A T E D I F F ( M I N U T E ,   G E T U T C D A T E ( ) ,   G E T D A T E ( ) ) ,   d t . [ D a t e T i m e ] )   =   C O N V E R T ( d a t e t i m e ,   C O N V E R T ( c h a r ( 8 ) ,   D A T E A D D ( M I N U T E ,   D A T E D I F F ( M I N U T E ,   G E T U T C D A T E ( ) ,   G E T D A T E ( ) ) ,   d t . [ D a t e T i m e ] ) ,   1 1 2 ) ,   1 1 2 ) )   A S   t b l  
 L E F T   J O I N   S t a n d a r d D a t a s e t   s d   O N   s d . S c h e m a N a m e   =   ' S t a t e '  
 L E F T   J O I N   S t a n d a r d D a t a s e t A g g r e g a t i o n H i s t o r y ( N O L O C K )   a h  
     O N   ( ( a h . A g g r e g a t i o n D a t e T i m e   > =   t b l . [ D a t e T i m e ] )   A N D   ( a h . A g g r e g a t i o n D a t e T i m e   <   D A T E A D D ( D A Y ,   1 ,   t b l . [ D a t e T i m e ] ) )   A N D   ( a h . D a t a s e t I d   =   s d . D a t a s e t I d )   A N D   ( a h . A g g r e g a t i o n T y p e I d   =   3 0 ) )  
 )  
 G O  
  
 G R A N T   S E L E C T   O N   G e t S t a t e D a i l y   T O   O p s M g r R e a d e r ,   O p s M g r W r i t e r  
 G O  
  
     I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   d b o . s y s o b j e c t s   W H E R E   i d   =   o b j e c t _ i d ( N ' d b o . G e t S t a t e H o u r l y ' )   a n d   x t y p e   i n   ( N ' F N ' ,   N ' I F ' ,   N ' T F ' ) )  
     E X E C U T E ( ' C R E A T E   F U N C T I O N   d b o . G e t S t a t e H o u r l y ( )   R E T U R N S   T A B L E   A S   R E T U R N   S E L E C T   N U L L   a s   B l a n k ' )  
 G O  
  
 A L T E R   F U N C T I O N   d b o . G e t S t a t e H o u r l y  
 (  
         @ S t a r t D a t e   d a t e t i m e  
       , @ E n d D a t e   d a t e t i m e  
 )  
 R E T U R N S   T A B L E  
 A S  
 R E T U R N   (  
 W I T H   D a t e T i m e C T E  
 A S   (  
         S E L E C T  
                 D a t e T i m e ,  
                 D a t e ,  
                 T i m e ,  
                 M i n u t e  
         F R O M   v D a t e T i m e   d t   W H E R E   d t . M i n u t e   =   0    
                 A N D   d t . D a t e T i m e   > =   @ S t a r t D a t e    
                 A N D   d t . D a t e T i m e   <   @ E n d D a t e    
                 A N D   d t . [ D a t e ]   B E T W E E N   D A T E A D D ( d a y ,   - 1 ,   @ S t a r t D a t e )   A N D   D A T E A D D ( d a y ,   1 ,   @ E n d D a t e )  
 )  
 S E L E C T  
     [ D a t e T i m e ] ,  
     [ D a t e ] ,  
     [ T i m e ] ,  
     M a n a g e d E n t i t y M o n i t o r R o w I d ,  
     M a n a g e d E n t i t y R o w I d ,  
     M o n i t o r R o w I d ,  
     I n t e r v a l D u r a t i o n M i l l i s e c o n d s ,  
     I n Y e l l o w S t a t e M i l l i s e c o n d s ,  
     I n R e d S t a t e M i l l i s e c o n d s ,  
     I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,  
     I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,  
     I n D i s a b l e d S t a t e M i l l i s e c o n d s ,  
     H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s ,  
     I n W h i t e S t a t e M i l l i s e c o n d s   =  
         C A S E  
             W H E N   ( ( M a n a g e d E n t i t y M o n i t o r E x i s t e d I n d   =   0 )   O R   ( a h . A g g r e g a t i o n C o u n t   =   0 )   O R   ( D A T E A D D ( m s ,   I n t e r v a l D u r a t i o n M i l l i s e c o n d s ,   [ D a t e T i m e ] )   > =   G E T U T C D A T E ( ) ) )   T H E N   I n t e r v a l D u r a t i o n M i l l i s e c o n d s   -   I n Y e l l o w S t a t e M i l l i s e c o n d s   -   I n R e d S t a t e M i l l i s e c o n d s   -   I n D i s a b l e d S t a t e M i l l i s e c o n d s   -   I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   E L S E   0  
         E N D ,  
     I n G r e e n S t a t e M i l l i s e c o n d s   =  
         C A S E  
             W H E N   ( M a n a g e d E n t i t y M o n i t o r E x i s t e d I n d   =   1 )   A N D   ( ( a h . A g g r e g a t i o n C o u n t   >   0 )   O R   ( ( a h . A g g r e g a t i o n C o u n t   I S   N U L L )   A N D   ( D A T E A D D ( m s ,   I n t e r v a l D u r a t i o n M i l l i s e c o n d s ,   [ D a t e T i m e ] )   <   G E T U T C D A T E ( ) ) ) )   T H E N   I n t e r v a l D u r a t i o n M i l l i s e c o n d s   -   I n Y e l l o w S t a t e M i l l i s e c o n d s   -   I n R e d S t a t e M i l l i s e c o n d s   -   I n D i s a b l e d S t a t e M i l l i s e c o n d s   -   I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   -   H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   E L S E   0  
         E N D  
 F R O M   ( S E L E C T  
     d t . [ D a t e T i m e ] ,  
     d t . [ D a t e ] ,  
     d t . [ T i m e ] ,  
     M a n a g e d E n t i t y M o n i t o r R o w I d   =   m e m . M a n a g e d E n t i t y M o n i t o r R o w I d ,  
     M a n a g e d E n t i t y R o w I d   =   m e m . M a n a g e d E n t i t y R o w I d ,  
     M o n i t o r R o w I d   =   m e m . M o n i t o r R o w I d ,  
     M a n a g e d E n t i t y M o n i t o r E x i s t e d I n d   =  
         C A S E  
             W H E N   m e m _ e x i s t s . M a n a g e d E n t i t y M o n i t o r R o w I d   I S   N U L L   T H E N   0   E L S E   1  
         E N D ,  
     I n t e r v a l D u r a t i o n M i l l i s e c o n d s   =   6 0   *   1 0 0 0   *   6 0 ,  
     I n Y e l l o w S t a t e M i l l i s e c o n d s   =   I S N U L L ( s . I n Y e l l o w S t a t e M i l l i s e c o n d s ,   0 ) ,  
     I n R e d S t a t e M i l l i s e c o n d s   =   I S N U L L ( s . I n R e d S t a t e M i l l i s e c o n d s ,   0 ) ,  
     I n D i s a b l e d S t a t e M i l l i s e c o n d s   =   I S N U L L ( s . I n D i s a b l e d S t a t e M i l l i s e c o n d s ,   0 ) ,  
     I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   =   I S N U L L ( s . I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,   0 ) ,  
     I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   =   I S N U L L ( s . I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s ,   0 ) ,  
     H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   =   I S N U L L ( s . H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s ,   0 )  
 F R O M   D a t e T i m e C T E   d t  
 C R O S S   J O I N   v M a n a g e d E n t i t y M o n i t o r   m e m  
 L E F T   J O I N   [ S t a t e ] . [ v S t a t e H o u r l y ]   s  
     O N   ( ( s . [ D a t e T i m e ]   =   d t . [ D a t e T i m e ] )   A N D   ( s . M a n a g e d E n t i t y M o n i t o r R o w I d   =   m e m . M a n a g e d E n t i t y M o n i t o r R o w I d ) )  
 L E F T   J O I N   ( S E L E C T   D I S T I N C T  
     m e m 2 . M a n a g e d E n t i t y M o n i t o r R o w I d ,  
     d t 2 . [ D a t e ] ,  
     d t 2 . [ T i m e ]  
 F R O M   D a t e T i m e C T E   d t 2  
 C R O S S   J O I N   v M a n a g e d E n t i t y M o n i t o r   m e m 2  
 J O I N   v M a n a g e d E n t i t y   m e  
     O N   ( m e . M a n a g e d E n t i t y R o w I d   =   m e m 2 . M a n a g e d E n t i t y R o w I d )  
 J O I N   v M o n i t o r M a n a g e m e n t P a c k V e r s i o n   m m p v  
     O N   ( m m p v . M o n i t o r R o w I d   =   m e m 2 . M o n i t o r R o w I d )  
 J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v  
     O N   ( ( m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d )   A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   m e . M a n a g e m e n t G r o u p R o w I d )   A N D   ( d t 2 . [ D a t e T i m e ]   > =   m g m p v . I n s t a l l e d D a t e T i m e )   A N D   ( d t 2 . [ D a t e T i m e ]   <   I S N U L L ( m g m p v . D e l e t e d D a t e T i m e ,   ' 9 9 9 9 1 2 3 1 ' ) ) )  
 J O I N   v M a n a g e d E n t i t y M a n a g e m e n t G r o u p   m e m g  
     O N   ( ( m e m 2 . M a n a g e d E n t i t y R o w I d   =   m e m g . M a n a g e d E n t i t y R o w I d )   A N D   ( d t 2 . [ D a t e T i m e ]   > =   m e m g . F r o m D a t e T i m e )   A N D   ( d t 2 . [ D a t e T i m e ]   <   I S N U L L ( m e m g . T o D a t e T i m e ,   ' 9 9 9 9 1 2 3 1 ' ) ) )  
 W H E R E   ( d t 2 . M i n u t e   =   0 ) )   A S   m e m _ e x i s t s  
     O N   ( m e m _ e x i s t s . M a n a g e d E n t i t y M o n i t o r R o w I d   =   m e m . M a n a g e d E n t i t y M o n i t o r R o w I d )   A N D   ( m e m _ e x i s t s . [ D a t e ]   =   d t . [ D a t e ] )   A N D   ( m e m _ e x i s t s . [ T i m e ]   =   d t . [ T i m e ] )  
 W H E R E   ( d t . M i n u t e   =   0 ) )   A S   t b l  
 L E F T   J O I N   S t a n d a r d D a t a s e t   s d   O N   s d . S c h e m a N a m e   =   ' S t a t e '  
 L E F T   J O I N   S t a n d a r d D a t a s e t A g g r e g a t i o n H i s t o r y ( N O L O C K )   a h  
     O N   ( ( a h . A g g r e g a t i o n D a t e T i m e   =   t b l . [ D a t e T i m e ] )   A N D   ( a h . D a t a s e t I d   =   s d . D a t a s e t I d )   A N D   ( a h . A g g r e g a t i o n T y p e I d   =   2 0 ) )  
 )  
 G O  
  
 G R A N T   S E L E C T   O N   G e t S t a t e H o u r l y   T O   O p s M g r R e a d e r ,   O p s M g r W r i t e r  
 G O  
     I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s o b j e c t s   W H E R E   t y p e   =   ' P '   A N D   n a m e   =   ' M a n a g e d E n t i t y C h a n g e ' )  
 	 B E G I N  
 	 	 E X E C U T E   ( ' C R E A T E   P R O C E D U R E   d b o . M a n a g e d E n t i t y C h a n g e   A S   R E T U R N   1 ' )  
 	 E N D  
 G O  
  
 A L T E R   P R O C E D U R E   d b o . M a n a g e d E n t i t y C h a n g e  
       @ M a n a g e m e n t G r o u p G u i d                   u n i q u e i d e n t i f i e r  
     , @ C h a n g e X m l                                       n t e x t  
     , @ S y n c h r o n i z a t i o n P r o c e s s I d         u n i q u e i d e n t i f i e r  
     , @ T a r g e t O p e r a t i o n a l S t a t e             v a r b i n a r y ( m a x )   =   N U L L  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
  
     D E C L A R E    
           @ E r r o r I n d                 b i t  
         , @ E r r o r M e s s a g e         n v a r c h a r ( m a x )  
         , @ E r r o r N u m b e r           i n t  
         , @ E r r o r S e v e r i t y       i n t  
         , @ E r r o r S t a t e             i n t  
         , @ E r r o r L i n e               i n t  
         , @ E r r o r P r o c e d u r e     n v a r c h a r ( 2 5 6 )  
         , @ E r r o r M e s s a g e T e x t   n v a r c h a r ( m a x )  
         , @ X m l D o c H a n d l e         i n t  
         , @ R e s u l t i n g S t a t e     t i n y i n t  
         , @ M a n a g e m e n t G r o u p R o w I d   i n t  
  
     S E T   @ E r r o r I n d   =   0  
     S E T   @ R e s u l t i n g S t a t e   =   1  
      
     - -   c h e c k   m a n a g e m e n t   g r o u p   i s   c o n n e c t e d   t o   t h i s   D W  
     D E C L A R E   @ C h e c k E x e c R e s u l t   i n t  
      
     E X E C   @ C h e c k E x e c R e s u l t   =   M a n a g e m e n t G r o u p A c c e s s C h e c k   @ M a n a g e m e n t G r o u p G u i d ,   @ M a n a g e m e n t G r o u p R o w I d   O U T P U T  
     I F   ( @ C h e c k E x e c R e s u l t   < >   0 )   R E T U R N   @ C h e c k E x e c R e s u l t  
      
     B E G I N   T R Y  
  
         D E C L A R E  
               @ E x e c R e s u l t   i n t  
             , @ S t a g i n g L o c k R e s o u r c e N a m e   s y s n a m e  
             , @ S t a g i n g L o c k S e t I n d   b i t  
             , @ C o n f i g L o c k R e s o u r c e N a m e   s y s n a m e  
             , @ C o n f i g L o c k S e t I n d   b i t  
  
         - -   e x e c u t e   g r o o m i n g  
         E X E C   I n s t a n c e M a i n t e n a n c e  
  
         E X E C   @ E x e c R e s u l t   =   s p _ x m l _ p r e p a r e d o c u m e n t   @ X m l D o c H a n d l e   O U T P U T ,   @ C h a n g e X m l  
         I F   @ E x e c R e s u l t   < >   0   R A I S E R R O R ( 7 7 7 9 7 1 0 0 0 ,   1 6 ,   1 ,   ' M a n a g e d E n t i t y C h a n g e ' ,   @ E x e c R e s u l t )  
  
         B E G I N   T R A N  
          
         - -   i n s e r t   d a t a   i n t o   s t a g i n g   t a b l e  
         I N S E R T   M a n a g e d E n t i t y S t a g e   (  
               D i s c o v e r e d I n d  
             , C h a n g e D a t e T i m e  
             , M a n a g e m e n t G r o u p R o w I d  
             , M a n a g e d E n t i t y G u i d  
             , M a n a g e d E n t i t y T y p e G u i d  
             , T o p L e v e l H o s t M a n a g e d E n t i t y G u i d  
             , F u l l N a m e  
             , [ P a t h ]  
             , [ N a m e ]  
             , D i s p l a y N a m e  
             , P r o p e r t y X m l  
         )  
         S E L E C T  
               C A S E   x m l . E v e n t T y p e  
                   W H E N   ' D i s c o v e r e d '   T H E N   1  
                   E L S E   0  
               E N D  
             , x m l . C h a n g e D a t e T i m e  
             , @ M a n a g e m e n t G r o u p R o w I d  
             , x m l . M a n a g e d E n t i t y G u i d  
             , x m l . M a n a g e d E n t i t y T y p e G u i d  
             , x m l . T o p L e v e l H o s t M a n a g e d E n t i t y G u i d  
             , F u l l N a m e  
             , [ P a t h ]  
             , [ N a m e ]  
             , D i s p l a y N a m e  
             , x m l . P r o p e r t y X m l  
         F R O M   O P E N X M L ( @ X m l D o c H a n d l e ,   ' R o o t / I t e m ' ,   2 )   W I T H   (  
                                             E v e n t T y p e                               v a r c h a r ( 1 5 )                   ' C h a n g e E v e n t '  
                                           , C h a n g e D a t e T i m e                     d a t e t i m e                         ' E v e n t D a t e T i m e '  
                                           , M a n a g e d E n t i t y G u i d               u n i q u e i d e n t i f i e r         ' I n s t a n c e G u i d '  
                                           , M a n a g e d E n t i t y T y p e G u i d       u n i q u e i d e n t i f i e r         ' I n s t a n c e T y p e G u i d '  
                                           , T o p L e v e l H o s t M a n a g e d E n t i t y G u i d   u n i q u e i d e n t i f i e r         ' T o p L e v e l H o s t M a n a g e d E n t i t y G u i d '  
                                           , F u l l N a m e                                 n v a r c h a r ( m a x )               ' F u l l N a m e '  
                                           , [ P a t h ]                                     n v a r c h a r ( m a x )               ' P a t h '  
                                           , [ N a m e ]                                     n v a r c h a r ( m a x )               ' N a m e '  
                                           , D i s p l a y N a m e                           n v a r c h a r ( m a x )               ' D i s p l a y N a m e '  
                                           , P r o p e r t y X m l                           x m l                                   ' P r o p e r t i e s / R o o t '  
                                 )   A S   x m l  
  
         E X E C   S y n c h r o n i z a t i o n P r o c e s s S t a t e S e t   @ M a n a g e m e n t G r o u p G u i d ,   @ S y n c h r o n i z a t i o n P r o c e s s I d ,   @ T a r g e t O p e r a t i o n a l S t a t e  
  
         C O M M I T  
          
         - -   i n d i c a t e   w e ' r e   d o n e   w i t h   s t g i n g   i n s e r t  
         S E T   @ R e s u l t i n g S t a t e   =   5  
          
         - -   l o c k   s t a g i n g   t o   e n s u r e   o n l y   o n e   p r o c e s s   d o e s   t h e   t r a n s f e r  
         S E T   @ S t a g i n g L o c k R e s o u r c e N a m e   =   ' M a n a g e d E n t i t y S t a g i n g '  
      
         E X E C   @ E x e c R e s u l t   =   s p _ g e t a p p l o c k  
                       @ R e s o u r c e   =   @ S t a g i n g L o c k R e s o u r c e N a m e  
                     , @ L o c k M o d e   =   ' E x c l u s i v e '  
                     , @ L o c k O w n e r   =   ' S e s s i o n '  
                     , @ L o c k T i m e o u t   =   0  
  
         I F   ( @ E x e c R e s u l t   =   - 1 )  
         B E G I N  
             - -   l o c k   t i m e o u t .   S o m e   o t h e r   t h r e a d   d o i n g   t r a n s f e r  
             G O T O   C l e a n u p  
         E N D  
          
         I F   ( @ E x e c R e s u l t   <   0 )  
         B E G I N  
             R A I S E R R O R ( 7 7 7 9 7 1 0 0 1 ,   1 6 ,   1 ,   ' M a n a g e d E n t i t y S t a g e A r e a ' ,   @ E x e c R e s u l t )  
         E N D  
  
         S E T   @ S t a g i n g L o c k S e t I n d   =   1  
  
         - -   i n d i c a t e   w e ' r e   w o r k i n g   w i t h   c o n f i g   s p a c e   u s i n g   t h e   l o c k  
         S E T   @ C o n f i g L o c k R e s o u r c e N a m e   =   ' C o n f i g u r a t i o n S p a c e '  
      
         E X E C   @ E x e c R e s u l t   =   s p _ g e t a p p l o c k  
                       @ R e s o u r c e   =   @ C o n f i g L o c k R e s o u r c e N a m e  
                     , @ L o c k M o d e   =   ' S h a r e d '  
                     , @ L o c k O w n e r   =   ' S e s s i o n '  
                     , @ L o c k T i m e o u t   =   0  
  
         I F   ( @ E x e c R e s u l t   =   - 1 )  
         B E G I N  
             - -   l o c k   t i m e o u t .   S o m e   o t h e r   t h r e a d   d o i n g   c o n f i g   w o r k  
             G O T O   C l e a n u p  
         E N D  
          
         I F   ( @ E x e c R e s u l t   <   0 )  
         B E G I N  
             R A I S E R R O R ( 7 7 7 9 7 1 0 0 1 ,   1 6 ,   1 ,   ' C o n f i g u r a t i o n S p a c e ' ,   @ E x e c R e s u l t )  
         E N D  
  
         S E T   @ C o n f i g L o c k S e t I n d   =   1  
  
         - -   d e l e t e   d a t a   f r o m   s t a g i n g   f o r   r e j e c t e d   M G s  
         D E L E T E   M a n a g e d E n t i t y S t a g e  
         W H E R E   M a n a g e m e n t G r o u p R o w I d   N O T   I N   ( S E L E C T   M a n a g e m e n t G r o u p R o w I d  
                                                                               F R O M   M a n a g e m e n t G r o u p   m g  
                                                                               W H E R E   ( m g . C o n n e c t C o n f i r m e d D a t e T i m e   I S   N O T   N U L L )  
                                                                                   A N D   ( m g . C o n n e c t R e j e c t e d I n d   =   0 )  
                                                                             )  
          
         - -   p r o c e s s   o n l y   t h e   l a t e s t   s t a g e d   d a t a   f o r   t h e   s a m e   M E  
         - -   d e l e t e   d a t a   t h a t   c a m e   i n   l a t e r   f o r   t h e   s a m e   M E  
         D E L E T E   s  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
         W H E R E   E X I S T S   ( S E L E C T   *  
                                     F R O M   M a n a g e d E n t i t y S t a g e  
                                     W H E R E   ( M a n a g e d E n t i t y G u i d   =   s . M a n a g e d E n t i t y G u i d )  
                                         A N D   ( M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
                                         A N D   ( C h a n g e D a t e T i m e   >   s . C h a n g e D a t e T i m e )  
                                   )  
          
         - -   d e l e t e   d a t a   t h a t   c a m e   i n   m a r k e d   w i t h   t h e   s a m e   d a t e   b u t    
         - -   t h e r e   i s   d a t a   t h a t   i s   " l a t e r "   i n   t e r m s   o f   r o w   i d s  
         D E L E T E   s  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
         W H E R E   E X I S T S   ( S E L E C T   *  
                                     F R O M   M a n a g e d E n t i t y S t a g e  
                                     W H E R E   ( M a n a g e d E n t i t y G u i d   =   s . M a n a g e d E n t i t y G u i d )  
                                         A N D   ( M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
                                         A N D   ( C h a n g e D a t e T i m e   =   s . C h a n g e D a t e T i m e )  
                                         A N D   ( M a n a g e d E n t i t y S t a g e R o w I d   >   s . M a n a g e d E n t i t y S t a g e R o w I d )  
                                   )  
  
         - -   u p d a t e   M E   t y p e   i n   s t a g i n g   t a b l e  
         U P D A T E   s  
         S E T   M a n a g e d E n t i t y T y p e R o w I d   =   m e t . M a n a g e d E n t i t y T y p e R o w I d  
         F R O M   M a n a g e d E n t i t y S t a g e   s   J O I N   M a n a g e d E n t i t y T y p e   m e t   O N   ( s . M a n a g e d E n t i t y T y p e G u i d   =   m e t . M a n a g e d E n t i t y T y p e G u i d )  
         W H E R E   s . M a n a g e d E n t i t y T y p e R o w I d   I S   N U L L  
          
         - -   f o r   r e c o r d s   s h o w i n g   t y p e   g u i d   o f   a l l   z e r o s  
         - -   s e t   e n t i t y   t y p e   t o   " S y s t e m . E n t i t y "   a n d   s e t  
         - -   h o s t   t o   s e l f .   T h e s e   r e c o r d s   a r e   w r i t t e n   t o   s t a g i n g  
         - -   p r i o r   t o   R 2   a n d   e n t i t y   t y p e   a n d   h o s t   a r e   n o t   t r a n s f e r r e d  
         D E C L A R E    
               @ S y s t e m E n t i t y T y p e R o w I d   i n t  
             , @ S y s t e m E n t i t y T y p e G u i d   u n i q u e i d e n t i f i e r  
  
         S E L E C T    
               @ S y s t e m E n t i t y T y p e R o w I d   =   M a n a g e d E n t i t y T y p e R o w I d  
             , @ S y s t e m E n t i t y T y p e G u i d   =   M a n a g e d E n t i t y T y p e G u i d  
         F R O M   M a n a g e d E n t i t y T y p e  
         W H E R E   M a n a g e d E n t i t y T y p e S y s t e m N a m e   =   ' S y s t e m . E n t i t y '  
  
         I F   ( @ S y s t e m E n t i t y T y p e R o w I d   I S   N O T   N U L L )  
         B E G I N  
             U P D A T E   s  
             S E T   M a n a g e d E n t i t y T y p e R o w I d   =   @ S y s t e m E n t i t y T y p e R o w I d  
                   , M a n a g e d E n t i t y T y p e G u i d   =   @ S y s t e m E n t i t y T y p e G u i d  
                   , T o p L e v e l H o s t M a n a g e d E n t i t y G u i d   =   s . M a n a g e d E n t i t y G u i d  
             F R O M   M a n a g e d E n t i t y S t a g e   s  
             W H E R E   ( s . M a n a g e d E n t i t y T y p e G u i d   =   ' 0 0 0 0 0 0 0 0 - 0 0 0 0 - 0 0 0 0 - 0 0 0 0 - 0 0 0 0 0 0 0 0 0 0 0 0 ' )  
         E N D  
          
         - -   u p d a t e   M E   h o s t   i n   s t a g i n g   t a b l e  
         U P D A T E   s  
         S E T   T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   =   m e . M a n a g e d E n t i t y R o w I d  
         F R O M   M a n a g e d E n t i t y S t a g e   s   J O I N   M a n a g e d E n t i t y   m e   O N   ( s . T o p L e v e l H o s t M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( s . M a n a g e m e n t G r o u p R o w I d   =   m e . M a n a g e m e n t G r o u p R o w I d )  
         W H E R E   s . T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   I S   N U L L  
  
         - -   s e t   h o s t   i f   t h i s   i s   a n   u p d a t e   o f   t h e   M E  
         U P D A T E   s  
         S E T   T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   =   m e . T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d  
         F R O M   M a n a g e d E n t i t y S t a g e   s   J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( s . M a n a g e m e n t G r o u p R o w I d   =   m e . M a n a g e m e n t G r o u p R o w I d )  
         W H E R E   s . T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   I S   N U L L  
  
         - -   s e t   v a l u e   f o r   s e l f - h o s t s   t o   n o n z e r o  
         - -   ( s o   t h a t   i t   b e c o m e s   " i n s e r t   r e a d y " )  
         U P D A T E   M a n a g e d E n t i t y S t a g e  
         S E T   T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   =   - 1  
         W H E R E   T o p L e v e l H o s t M a n a g e d E n t i t y G u i d   =   M a n a g e d E n t i t y G u i d  
  
         - -   c a l c u l a t e   p r o p e r t y   d e l t a   f o r   u p d a t e d   M E s  
         U P D A T E   s  
         S E T   D e l t a X m l   =   ' < R o o t > '   +   d b o . f n _ B u i l d I n s t a n c e P r o p e r t y D e l t a ( s . P r o p e r t y X m l ,   m e p . P r o p e r t y X m l )   +   ' < / R o o t > '  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
                     J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
                     L E F T   J O I N   M a n a g e d E n t i t y P r o p e r t y   m e p   O N   ( ( m e p . M a n a g e d E n t i t y R o w I d   =   m e . M a n a g e d E n t i t y R o w I d )   A N D    
                                                                                                     ( m e p . T o D a t e T i m e   I S   N U L L ) )  
         W H E R E   ( s . I n s e r t R e a d y I n d   >   0 )  
             A N D   ( s . D i s c o v e r e d I n d   =   1 )  
          
         S E T   @ R e s u l t i n g S t a t e   =   1 0  
  
         B E G I N   T R A N  
          
         - -   c r e a t e   M E   i f   i t   d i d   n o t   e x i s t  
         I N S E R T   M a n a g e d E n t i t y   (  
               M a n a g e m e n t G r o u p R o w I d  
             , M a n a g e d E n t i t y G u i d  
             , M a n a g e d E n t i t y T y p e R o w I d  
             , T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d  
             , F u l l N a m e  
             , [ P a t h ]  
             , [ N a m e ]  
             , D i s p l a y N a m e  
         )  
         S E L E C T  
               s . M a n a g e m e n t G r o u p R o w I d  
             , s . M a n a g e d E n t i t y G u i d  
             , I S N U L L ( s . M a n a g e d E n t i t y T y p e R o w I d ,   @ S y s t e m E n t i t y T y p e R o w I d )   - -   s e t   e n t i t y   t y p e   t o   " e n t i t y "   i f   t y p e   c a n n o t   b e   o b t a i n e d   ( d e l e t e )  
             , C A S E  
                   W H E N   s . T o p L e v e l H o s t M a n a g e d E n t i t y G u i d   =   s . M a n a g e d E n t i t y G u i d   T H E N   N U L L  
                   E L S E   s . T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d  
               E N D  
             , s . F u l l N a m e  
             , s . [ P a t h ]  
             , s . [ N a m e ]  
             , s . D i s p l a y N a m e  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
         W H E R E   ( s . I n s e r t R e a d y I n d   >   0 )  
             - - A N D   ( s . D i s c o v e r e d I n d   =   1 )   - -   c r e a t e   e v e n   d e l e t e d   M E s   s o   t h a t   w e   c a n   p r o c e s s   t h e i r   i n i t i a l   s t a t e s  
                                                                     - -   o u t   o f   s t a t e   s t a g e   t a b l e  
             A N D   ( N O T   E X I S T S   ( S E L E C T   *  
                                               F R O M   M a n a g e d E n t i t y  
                                               W H E R E   ( M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
                                                   A N D   ( M a n a g e d E n t i t y G u i d   =   s . M a n a g e d E n t i t y G u i d )  
                                             )  
                     )  
  
         - -   s e t   s e l f - h o s t   M E   i d  
         U P D A T E   M a n a g e d E n t i t y  
         S E T   T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   =   M a n a g e d E n t i t y R o w I d  
         W H E R E   T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   I S   N U L L  
          
         - -   u p d a t e   M E   d i s p l a y   n a m e   i f   i t   w a s   c h a n g e d   o n   t h e   O p e r a t i o n a l   s i d e  
         U P D A T E   M a n a g e d E n t i t y  
         S E T   D i s p l a y N a m e   =   s . D i s p l a y N a m e  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
                     J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
         W H E R E   ( s . D i s p l a y N a m e   < >   m e . D i s p l a y N a m e )  
          
         - -   u p d a t e   M E   n a m e s ,   t y p e   a n d   h o s t  
         - -   i f   M E   s h o w s   t y p e   o f   " e n t i t y "  
         - -   w h i c h   m e a n s   i t   w a s   c r e a t e d   o u t  
         - -   o f   r e c o r d s   t h a t   w e r e   w r i t t e n   t o   s t a g i n g  
         - -   p r i o r   t o   R 2   a s   d e l e t e d   e n t i t y   a n d  
         - -   w e   d i d   n o t   k n o w   i t s   t y p e   a t   t h e   t i m e  
         I F   ( @ S y s t e m E n t i t y T y p e R o w I d   I S   N O T   N U L L )  
         B E G I N  
             U P D A T E   m e  
             S E T   M a n a g e d E n t i t y T y p e R o w I d   =   s . M a n a g e d E n t i t y T y p e R o w I d  
                   , T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d   =   s . T o p L e v e l H o s t M a n a g e d E n t i t y R o w I d  
                   , F u l l N a m e   =   s . F u l l N a m e  
                   , [ P a t h ]   =   s . [ P a t h ]  
                   , [ N a m e ]   =   s . [ N a m e ]  
                   , D i s p l a y N a m e   =   s . D i s p l a y N a m e  
             F R O M   M a n a g e d E n t i t y   m e    
                 J O I N   M a n a g e d E n t i t y S t a g e   s   O N   ( m e . M a n a g e d E n t i t y G u i d   =   s . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
             W H E R E   ( m e . M a n a g e d E n t i t y T y p e R o w I d   =   @ S y s t e m E n t i t y T y p e R o w I d )  
                 A N D   ( s . M a n a g e d E n t i t y T y p e R o w I d   < >   @ S y s t e m E n t i t y T y p e R o w I d )  
                 A N D   ( s . i n s e r t R e a d y I n d   >   0 )  
         E N D  
          
         - -   p r o c e s s   d e l e t e s   a n d   c l o s e   o l d   M E - M G   r e l a t i o n s h i p   ( i f   a n y )  
          
         U P D A T E   m e m g  
         S E T   T o D a t e T i m e   =   s . C h a n g e D a t e T i m e  
               , D W L a s t M o d i f i e d D a t e T i m e   =   G E T U T C D A T E ( )  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
                     J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
                     J O I N   M a n a g e d E n t i t y M a n a g e m e n t G r o u p   m e m g   O N   ( m e . M a n a g e d E n t i t y R o w I d   =   m e m g . M a n a g e d E n t i t y R o w I d )  
         W H E R E   ( s . D i s c o v e r e d I n d   =   0 )  
             A N D   ( s . I n s e r t R e a d y I n d   >   0 )  
             A N D   ( m e m g . T o D a t e T i m e   I S   N U L L )  
              
         - -   c l o s e   p r o p e r t y   s e t s   f o r   d e l e t e d   M E s  
              
         U P D A T E   m e p  
         S E T   T o D a t e T i m e   =   s . C h a n g e D a t e T i m e  
               , D W L a s t M o d i f i e d D a t e T i m e   =   G E T U T C D A T E ( )  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
                     J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
                     J O I N   M a n a g e d E n t i t y P r o p e r t y   m e p   O N   ( m e . M a n a g e d E n t i t y R o w I d   =   m e p . M a n a g e d E n t i t y R o w I d )  
         W H E R E   ( s . D i s c o v e r e d I n d   =   0 )  
             A N D   ( s . I n s e r t R e a d y I n d   >   0 )  
             A N D   ( m e p . T o D a t e T i m e   I S   N U L L )  
              
         - -   i n s e r t   n e w   M E - M G   r e l a t i o n s h i p   f o r   d i s c o v e r i e s   i f   n o t   y e t   e x i s t s  
          
         I N S E R T   M a n a g e d E n t i t y M a n a g e m e n t G r o u p   (  
               M a n a g e d E n t i t y R o w I d  
             , F r o m D a t e T i m e  
             , T o D a t e T i m e  
         )  
         S E L E C T  
               m e . M a n a g e d E n t i t y R o w I d  
             , s . C h a n g e D a t e T i m e  
             , C A S E  
                   W H E N   s . D i s c o v e r e d I n d   =   1   T H E N   N U L L  
                   E L S E   s . C h a n g e D a t e T i m e  
               E N D  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
                     J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
         W H E R E   ( s . I n s e r t R e a d y I n d   >   0 )  
             - - A N D   ( s . D i s c o v e r e d I n d   =   1 )   - -   c r e a t e   e v e n   d e l e t e d   M E s   s o   t h a t   w e   c a n   p r o c e s s   t h e i r   i n i t i a l   s t a t e s  
                                                                     - -   o u t   o f   s t a t e   s t a g e   t a b l e  
             A N D   N O T   E X I S T S   ( S E L E C T   *  
                                             F R O M   M a n a g e d E n t i t y M a n a g e m e n t G r o u p  
                                             W H E R E   ( M a n a g e d E n t i t y R o w I d   =   m e . M a n a g e d E n t i t y R o w I d )  
                                                 A N D   ( s . C h a n g e D a t e T i m e   B E T W E E N   F r o m D a t e T i m e   A N D   I S N U L L ( T o D a t e T i m e ,   ' 9 9 9 9 1 2 3 1 ' ) )  
                                           )  
          
         - -   c l o s e   o l d   p r o p e r t y   s e t s   f o r   d i s c o v e r e d   M E s   i f   o n e   e x i s t s  
              
         U P D A T E   m e p  
         S E T   T o D a t e T i m e   =   s . C h a n g e D a t e T i m e  
               , D W L a s t M o d i f i e d D a t e T i m e   =   G E T U T C D A T E ( )  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
                     J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
                     J O I N   M a n a g e d E n t i t y P r o p e r t y   m e p   O N   ( m e . M a n a g e d E n t i t y R o w I d   =   m e p . M a n a g e d E n t i t y R o w I d )  
         W H E R E   ( s . D i s c o v e r e d I n d   =   1 )  
             A N D   ( s . I n s e r t R e a d y I n d   >   0 )  
             A N D   ( s . D e l t a X m l   I S   N O T   N U L L )  
             A N D   ( m e p . T o D a t e T i m e   I S   N U L L )  
             A N D   ( s . C h a n g e D a t e T i m e   < >   m e p . F r o m D a t e T i m e )   - -   D o n ' t   e x p i r e   t h e   p r o p e r t y   s e t   i f   i t   i s   f r o m   t h e   s a m e   t i m e   a s   t h e   n e w   o n e   ( p r e v e n t s   u n i q u e n e s s   c o n f l i c t s   i n   c a s e   o f   r e - s y n c h i n g )  
              
         - -   i n s e r t   n e w   p r o p e r t y   s e t s   f o r   d i s c o v e r i e s   i f   n o t   y e t   e x i s t s  
          
         I N S E R T   M a n a g e d E n t i t y P r o p e r t y   (  
               M a n a g e d E n t i t y R o w I d  
             , P r o p e r t y X m l  
             , D e l t a X m l  
             , F r o m D a t e T i m e  
         )  
         S E L E C T  
               m e . M a n a g e d E n t i t y R o w I d  
             , s . P r o p e r t y X m l  
             , s . D e l t a X m l  
             , s . C h a n g e D a t e T i m e  
         F R O M   M a n a g e d E n t i t y S t a g e   s  
                     J O I N   M a n a g e d E n t i t y   m e   O N   ( s . M a n a g e d E n t i t y G u i d   =   m e . M a n a g e d E n t i t y G u i d )   A N D   ( m e . M a n a g e m e n t G r o u p R o w I d   =   s . M a n a g e m e n t G r o u p R o w I d )  
         W H E R E   ( s . I n s e r t R e a d y I n d   >   0 )  
             A N D   ( s . D i s c o v e r e d I n d   =   1 )  
             A N D   N O T   E X I S T S   ( S E L E C T   *  
                                             F R O M   M a n a g e d E n t i t y P r o p e r t y  
                                             W H E R E   ( M a n a g e d E n t i t y R o w I d   =   m e . M a n a g e d E n t i t y R o w I d )  
                                                 A N D   ( T o D a t e T i m e   I S   N U L L )  
                                           )  
          
         S E T   @ R e s u l t i n g S t a t e   =   1 5  
  
         - -   d e l e t e   p r o c e s s e d   s t a g i n g   r o w s  
         D E L E T E   M a n a g e d E n t i t y S t a g e  
         W H E R E   ( I n s e r t R e a d y I n d   >   0 )  
                
         C O M M I T  
  
         - -   c l o s e   H S   o u t a g e   p e r i o d s   t h a t   a r e   o p e n   f o r  
         - -   h e a l t h   s e r v i c e s   t h a t   d o   n o t   o r   d i d   n o t   e x i s t   a t   a n y   t i m e  
         - -   d u r i n g   t h e   p e r i o d  
         U P D A T E   h s o  
         S E T   h s o . E n d D a t e T i m e   =   m e m g . T o D a t e T i m e  
               , h s o . D W L a s t M o d i f i e d D a t e T i m e   =   G E T U T C D A T E ( )  
         F R O M   H e a l t h S e r v i c e O u t a g e   h s o   ( T A B L O C K X )  
                     J O I N   M a n a g e d E n t i t y M a n a g e m e n t G r o u p   m e m g   O N   ( h s o . M a n a g e d E n t i t y R o w I d   =   m e m g . M a n a g e d E n t i t y R o w I d )  
         W H E R E   ( h s o . E n d D a t e T i m e   I S   N U L L )  
             A N D   ( h s o . S t a r t D a t e T i m e   < =   m e m g . T o D a t e T i m e )  
     E N D   T R Y  
     B E G I N   C A T C H  
         I F   ( @ @ T R A N C O U N T   >   0 )  
             R O L L B A C K   T R A N  
      
         S E L E C T    
               @ E r r o r N u m b e r   =   E R R O R _ N U M B E R ( )  
             , @ E r r o r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
             , @ E r r o r S t a t e   =   E R R O R _ S T A T E ( )  
             , @ E r r o r L i n e   =   E R R O R _ L I N E ( )  
             , @ E r r o r P r o c e d u r e   =   I S N U L L ( E R R O R _ P R O C E D U R E ( ) ,   ' - ' )  
             , @ E r r o r M e s s a g e T e x t   =   E R R O R _ M E S S A G E ( )  
  
         S E T   @ E r r o r I n d   =   1  
     E N D   C A T C H  
  
 C l e a n u p :  
     - -   c l e a n u p  
  
     I F   ( @ C o n f i g L o c k S e t I n d   =   1 )  
     B E G I N  
         E X E C   @ E x e c R e s u l t   =   s p _ r e l e a s e a p p l o c k  
                               @ R e s o u r c e   =   @ C o n f i g L o c k R e s o u r c e N a m e  
                             , @ L o c k O w n e r   =   ' S e s s i o n '  
                              
         S E T   @ C o n f i g L o c k S e t I n d   =   0  
     E N D  
  
     I F   ( @ S t a g i n g L o c k S e t I n d   =   1 )  
     B E G I N  
         E X E C   @ E x e c R e s u l t   =   s p _ r e l e a s e a p p l o c k  
                               @ R e s o u r c e   =   @ S t a g i n g L o c k R e s o u r c e N a m e  
                             , @ L o c k O w n e r   =   ' S e s s i o n '  
                              
         S E T   @ S t a g i n g L o c k S e t I n d   =   0  
     E N D  
  
     I F   ( @ X m l D o c H a n d l e   I S   N O T   N U L L )  
         E X E C   s p _ x m l _ r e m o v e d o c u m e n t   @ X m l D o c H a n d l e  
  
     - -   r e p o r t   e r r o r   i f   a n y  
     I F   ( @ E r r o r I n d   =   1 )  
     B E G I N  
         D E C L A R E   @ A d j u s t e d E r r o r S e v e r i t y   i n t  
  
         S E T   @ A d j u s t e d E r r o r S e v e r i t y   =   C A S E  
                                                                       W H E N   @ E r r o r S e v e r i t y   >   1 8   T H E N   1 8  
                                                                       E L S E   @ E r r o r S e v e r i t y  
                                                                   E N D  
          
         R A I S E R R O R   ( 7 7 7 9 7 1 0 0 2 ,   @ A d j u s t e d E r r o r S e v e r i t y ,   @ R e s u l t i n g S t a t e  
             , @ E r r o r N u m b e r  
             , @ E r r o r S e v e r i t y  
             , @ E r r o r S t a t e  
             , @ E r r o r P r o c e d u r e  
             , @ E r r o r L i n e  
             , @ E r r o r M e s s a g e T e x t  
         )  
     E N D  
 E N D  
 G O  
  
 G R A N T   E X E C U T E   O N   M a n a g e d E n t i t y C h a n g e   T O   O p s M g r W r i t e r  
 G O  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   C R E A T E   P R O C E D U R E  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
   I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s o b j e c t s   W H E R E   t y p e   =   ' P '   A N D   n a m e   =   ' M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s I n f o ' )  
       B E G I N  
             E X E C U T E   ( ' C R E A T E   P R O C E D U R E   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s I n f o ]   A S   R E T U R N   1 ' )  
       E N D  
 G O  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   A L T E R   P R O C E D U R E  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 A L T E R   P R O C E D U R E   [ S D K ] . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s I n f o ]  
       @ S t a r t D a t e         D A T E T I M E   =   N U L L ,  
       @ E n d D a t e             D A T E T I M E   =   N U L L ,  
       @ M P X M L 	           X M L   =   N U L L ,  
       @ M G P X M L 	 	   X M L   =   N U L L ,  
       @ L a n g u a g e C o d e   v a r c h a r ( 3 ) =   ' E N U '  
  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   D E C L A R E   L O C A L   V A R I A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 D E C L A R E   @ T o t a l A l e r t s   D E C I M A L  
 D E C L A R E   @ E r r o r   I N T  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   C R E A T E   T E M P   T A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 C R E A T E   T A B L E   # t m p M P L i s t   ( M a n a g e m e n t P a c k R o w I d   I N T )  
 C R E A T E   T A B L E   # t m p A l e r t L i s t   (   A l e r t G u i d   U N I Q U E I D E N T I F I E R   )  
 C r e a t e   T a b l e   # t m p M G P   ( M a n a g e m e n t G r o u p R o w I d 	 	 i n t )  
 C r e a t e   T a b l e   # t m p M P   ( M a n a g e m e n t P a c k R o w I d 	 i n t )  
 	 	 	 	  
 - - H A N D L E   E R R O R S  
 S E T   @ E r r o r   =   @ @ E R R O R  
 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   G E T   M P   D E T A I L  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 I n s e r t   I n t o   # t m p M P  
 S e l e c t 	 M p . M a n a g e m e n t P a c k R o w I d  
 F r o m   @ M P X M L . n o d e s ( ' / * / V a l u e ' )   A s   M p L i s t ( M a n a g e m e n t P a c k G u i d )  
 I n n e r   J o i n   v M a n a g e m e n t P a c k   ( N o L o c k )   M p  
 O n   M p . M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d   =   M p L i s t . M a n a g e m e n t P a c k G u i d . v a l u e ( ' . ' , ' u n i q u e i d e n t i f i e r ' )  
  
 - - H A N D L E   E R R O R S  
 S E T   @ E r r o r   =   @ @ E R R O R  
 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   C R E A T E   T E M P   M G P   T A B L E  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 I n s e r t   I n t o   # t m p M G P  
 S e l e c t 	 M g p . M a n a g e m e n t G r o u p R o w I d  
 F r o m   @ M G P X M L . n o d e s ( ' / * / V a l u e ' )   A s   M g p L i s t ( M a n a g e m e n t G r o u p G u i d )  
 I n n e r   J o i n   v M a n a g e m e n t G r o u p   ( N o L o c k )   M g p  
 O n   M g p . M a n a g e m e n t G r o u p G u i d   =   M g p L i s t . M a n a g e m e n t G r o u p G u i d . v a l u e ( ' . ' , ' u n i q u e i d e n t i f i e r ' )  
  
 - - H A N D L E   E R R O R S  
 S E T   @ E r r o r   =   @ @ E R R O R  
 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   I N S E R T   M P   I D ' s   I N T O   T E M P   T A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 I N S E R T   I N T O   # t m p M P L i s t   ( M a n a g e m e n t P a c k R o w I d )  
 S e l e c t   d i s t i n c t   M p c . M a n a g e m e n t P a c k R o w I d  
 F r o m   # t m p M P     M p c  
 I n n e r   J o i n   v M a n a g e m e n t P a c k V e r s i o n   M p v  
 O n   M p v . M a n a g e m e n t P a c k R o w I d   =   M p c . M a n a g e m e n t P a c k R o w I d  
 I n n e r   J o i n   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   M g m p v  
 O n   M g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   M p v . M a n a g e m e n t P a c k V e r s i o n R o w I d  
 I n n e r   J o i n   # t m p M G P   M g p  
 O n   M g p . M a n a g e m e n t G r o u p R o w I d   =   M g m p v . M a n a g e m e n t G r o u p R o w I d  
 	 	 	  
 - - H A N D L E   E R R O R S  
 S E T   @ E r r o r   =   @ @ E R R O R  
 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   I N S E R T   A L E R T   I D ' s   I N T O   T E M P   T A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 I N S E R T   I N T O   # t m p A l e r t L i s t   (   A l e r t G u i d   )  
 S E L E C T   D I S T I N C T   v A l e r t . A l e r t G u i d  
 F R O M   A l e r t . v A l e r t   v A l e r t  
 L E F T   O U T E R   J O I N   d b o . v M o n i t o r   v M o n i t o r   O N   ( v A l e r t . W o r k f l o w R o w I d   =   v M o n i t o r . M o n i t o r R o w I d )  
                                                                           A N D   ( v A l e r t . M o n i t o r A l e r t I n d   =   1 )  
 L E F T   O U T E R   J O I N   d b o . v R u l e   v R u l e   O N   ( v A l e r t . W o r k f l o w R o w I d   =   v R u l e . R u l e R o w I d )  
                                                               A N D   ( v A l e r t . M o n i t o r A l e r t I n d   =   0 )  
 I N N E R   J O I N   d b o . v M a n a g e m e n t P a c k   v M P   O N   ( C A S E  
                                                                                     W H E N   v A l e r t . M o n i t o r A l e r t I n d   =   1   T H E N   v M o n i t o r . M a n a g e m e n t P a c k R o w I d  
                                                                                     E L S E     v R u l e . M a n a g e m e n t P a c k R o w I d  
                                                                               E N D )   =   v M P . M a n a g e m e n t P a c k R o w I d  
 I N N E R   J O I N   # t m p M P L i s t   O N   v M P . M a n a g e m e n t P a c k R o w I d   =   # t m p M P L i s t . M a n a g e m e n t P a c k R o w I d  
 I n n e r   J o i n   v M a n a g e d E n t i t y   ( N o L o c k )   M e t  
 O n   M e t . M a n a g e d E n t i t y R o w I d   =   v A l e r t . M a n a g e d E n t i t y R o w I d  
 I n n e r   J o i n   # t m p M G P   M g  
 O n   M e t . M a n a g e m e n t G r o u p R o w I d   =   M g . M a n a g e m e n t G r o u p R o w I d  
 W H E R E   - - F i l t e r   b y   d a t e t i m e  
             (   ( v A l e r t . R a i s e d D a t e T i m e   > =   @ S t a r t D a t e )   A N D   ( v A l e r t . R a i s e d D a t e T i m e   <   @ E n d D a t e )   )  
 G R O U P   B Y   v A l e r t . A l e r t G u i d  
  
 - - H A N D L E   E R R O R S  
 S E T   @ E r r o r   =   @ @ E R R O R  
 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   S E T   L O C A L   V A R I A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 S E T   @ T o t a l A l e r t s   =   ( S E L E C T   C O U N T ( * )   F R O M   # t m p A l e r t L i s t )  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   F I N A L   R E S U L T   S E T  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 S E L E C T   _ v A l e r t . W o r k f l o w R o w I d ,  
               _ v A l e r t . A l e r t N a m e ,  
 	       _ v A l e r t . S e v e r i t y , 	        
 	       _ v A l e r t . p r i o r i t y ,  
               _ v A l e r t . M a n a g e m e n t P a c k R o w I d ,  
               I S N U L L ( v D i s p l a y S t r i n g M P . N a m e , v M P . M a n a g e m e n t P a c k D e f a u l t N a m e )   A S   M P N a m e ,  
               v M P . M a n a g e m e n t P a c k D e f a u l t D e s c r i p t i o n ,  
 	       v M P . M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d ,  
               _ v A l e r t . M o n i t o r G u i d ,  
               I S N U L L ( v D i s p l a y S t r i n g M o n i t o r . N a m e , v M o n i t o r . M o n i t o r D e f a u l t N a m e )   A S   M o n i t o r N a m e ,  
               _ v A l e r t . R u l e G u i d ,  
               I S N U L L ( v D i s p l a y S t r i n g R u l e . N a m e , v R u l e . R u l e D e f a u l t N a m e )   A S   R u l e N a m e ,              
               _ v A l e r t . R e p e a t C o u n t ,                
 	       R O W _ N U M B E R ( )   O V E R ( O R D E R   B Y   _ v A l e r t . R e p e a t C o u n t   D e s c )   A S   ' R o w N u m b e r '  
 F R O M    
 (  
       S E L E C T   s u b A l e r t s . W o r k f l o w R o w I d ,  
                     s u b A l e r t s . A l e r t N a m e ,  
 	 	     s u b A l e r t s . S e v e r i t y ,  
 	 	     s u b A l e r t s . P r i o r i t y ,  
                     v M P . M a n a g e m e n t P a c k R o w I d ,  
                     v M o n i t o r . M o n i t o r G u i d ,  
                     v R u l e . R u l e G u i d ,                    
                     C O U N T ( * )   A S   R e p e a t C o u n t  
 	 	                          
       F R O M   A l e r t . v A l e r t   s u b A l e r t s  
       I N N E R   J O I N   # t m p A l e r t L i s t   O N   s u b A l e r t s . A l e r t G u i d   =   # t m p A l e r t L i s t . A l e r t G u i d  
       L E F T   O U T E R   J O I N   d b o . v M o n i t o r   v M o n i t o r   O N   ( s u b A l e r t s . W o r k f l o w R o w I d   =   v M o n i t o r . M o n i t o r R o w I d )  
                                                                                 A N D   ( s u b A l e r t s . M o n i t o r A l e r t I n d   =   1 )  
       L E F T   O U T E R   J O I N   d b o . v R u l e   v R u l e   O N   ( s u b A l e r t s . W o r k f l o w R o w I d   =   v R u l e . R u l e R o w I d )  
                                                                     A N D   ( s u b A l e r t s . M o n i t o r A l e r t I n d   =   0 )  
       L E F T   O U T E R   J O I N   A l e r t . v A l e r t R e s o l u t i o n S t a t e   v A l e r t R S   O N   s u b A l e r t s . A l e r t G u i d   =   v A l e r t R S . A l e r t G u i d  
                                                                                                                         A N D   v A l e r t R S . R e s o l u t i o n S t a t e = 2 5 5  
       I N N E R   J O I N   d b o . v M a n a g e m e n t P a c k   v M P   O N   ( C A S E  
                                                                       W H E N   s u b A l e r t s . M o n i t o r A l e r t I n d   =   1   T H E N   v M o n i t o r . M a n a g e m e n t P a c k R o w I d  
                                                                       E L S E     v R u l e . M a n a g e m e n t P a c k R o w I d  
                                                                   E N D )   =   v M P . M a n a g e m e n t P a c k R o w I d  
       G R O U P   B Y   s u b A l e r t s . W o r k f l o w R o w I d ,  
                         s u b A l e r t s . A l e r t N a m e ,  
                         v M P . M a n a g e m e n t P a c k R o w I d ,  
                         v M o n i t o r . M o n i t o r G u i d ,  
                         v R u l e . R u l e G u i d ,  
 	 	 	 s u b A l e r t s . S e v e r i t y ,  
 	 	 	 s u b A l e r t s . P r i o r i t y  
 )   A S   _ v A l e r t  
 L E F T   O U T E R   J O I N   d b o . v M o n i t o r   v M o n i t o r   O N   _ v A l e r t . M o n i t o r G u i d   =   v M o n i t o r . M o n i t o r G u i d  
 L E F T   O U T E R   J O I N   d b o . v R u l e   v R u l e   O N   _ v A l e r t . R u l e G u i d   =   v R u l e . R u l e G u i d  
 I N N E R   J O I N   d b o . v M a n a g e m e n t P a c k   v M P   O N   _ v A l e r t . M a n a g e m e n t P a c k R o w I d   =   v M P . M a n a g e m e n t P a c k R o w I d  
 L E F T   O U T E R   J O I N   d b o . v D i s p l a y S t r i n g   v D i s p l a y S t r i n g M o n i t o r   O N   v M o n i t o r . M o n i t o r G u i d   =   v D i s p l a y S t r i n g M o n i t o r . E l e m e n t G u i d   A N D   v D i s p l a y S t r i n g M o n i t o r . L a n g u a g e C o d e   =   @ L a n g u a g e C o d e  
 L E F T   O U T E R   J O I N   d b o . v D i s p l a y S t r i n g   v D i s p l a y S t r i n g R u l e   O N   v R u l e . R u l e G u i d   =   v D i s p l a y S t r i n g R u l e . E l e m e n t G u i d   A N D   v D i s p l a y S t r i n g R u l e . L a n g u a g e C o d e   =   @ L a n g u a g e C o d e  
 L E F T   O U T E R   J O I N   d b o . v D i s p l a y S t r i n g   v D i s p l a y S t r i n g M P   O N   v M P . M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d   =   v D i s p l a y S t r i n g M P . E l e m e n t G u i d   A N D   v D i s p l a y S t r i n g M P . L a n g u a g e C o d e   =   @ L a n g u a g e C o d e  
  
 O R D E R   B Y   _ v A l e r t . R e p e a t C o u n t   D E S C  
  
  
 - - H A N D L E   E R R O R S  
 S E T   @ E r r o r   =   @ @ E R R O R  
 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   E R R O R   H A N D E L I N G   A N D   T E M P   C L E A N U P  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 Q u i t E r r o r :  
     I F   O B J E C T _ I D ( ' t e m p d b . . # t m p M P L i s t ' )   I S   N O T   N U L L  
     B E G I N  
 	 D R O P   T A B L E   # t m p M P L i s t  
     E N D  
      
     I F   O B J E C T _ I D ( ' t e m p d b . . # t m p A l e r t L i s t ' )   I S   N O T   N U L L  
     B E G I N  
 	 	 D R O P   T A B L E   # t m p A l e r t L i s t  
     E N D  
      
     I F   O B J E C T _ I D ( ' t e m p d b . . # t m p M P ' )   I S   N O T   N U L L      
     B E G I N  
 	 	 D R O P   T A B L E   # t m p M P  
     E N D  
  
     I F   O B J E C T _ I D ( ' t e m p d b . . # t m p M G P ' )   I S   N O T   N U L L      
     B E G I N  
 	 	 D R O P   T A B L E   # t m p M G P  
     E N D  
  
     R E T U R N   @ E r r o r  
  
 E N D  
 G O  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   P E R M I S S I O N S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 G R A N T   E X E C U T E   O N   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s I n f o ]   T O   O p s M g r R e a d e r  
 G O  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   C R E A T E   P R O C E D U R E  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s o b j e c t s   W H E R E   t y p e   =   ' P '   A N D   n a m e   =   ' M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s S o u r c e I n f o ' )  
 	 B E G I N  
 	 	 E X E C U T E   ( ' C R E A T E   P R O C E D U R E   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s S o u r c e I n f o ]   A S   R E T U R N   1 ' )  
 	 E N D  
 G O  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   A L T E R   P R O C E D U R E  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 A L T E R   P R O C E D U R E   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s S o u r c e I n f o ]    
 	 	 @ S t a r t D a t e 	 	 D a t e t i m e ,  
 	 	 @ E n d D a t e 	 	 D a t e t i m e , 	 	  
 	 	 @ M o n i t o r O r R u l e G u i d 	 	 x m l ,  
 	 	 @ M P X M L 	 	 	 x m l ,  
 	 	 @ D T X M L 	 	 	 x m l ,  
 	 	 @ M G P X M L 	 	 	 x m l , 	                  
 	 	 @ L a n g u a g e C o d e       v a r c h a r ( 3 )  
  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   D E C L A R E   L O C A L   V A R I A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =     	 	  
 	 D e c l a r e 	 @ E r r o r 	 	 	 i n t ,  
 	                 @ S h o w A l e r t s 	 	 b i t 	                 	                  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   C R E A T E   T E M P   T A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 	 	 	 C r e a t e   T a b l e   # T m p O p s S r c  
 	 	 	 (  
 	 	 	 	 O p t i o n I d 	 i n t  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T m p M o n i t o r O r R u l e G u i d  
 	 	 	 (  
 	 	 	       M o n R u l G u i d     u n i q u e i d e n t i f i e r  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T m p M P s S r c  
 	 	 	 (  
 	 	 	 	 M a n a g e m e n t P a c k R o w I d 	 i n t ,  
 	 	 	 	 M a n a g e m e n t P a c k S y s t e m N a m e   n v a r c h a r ( 5 1 2 )  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T m p M G P S r c  
 	 	 	 (  
 	 	 	 	 M a n a g e m e n t G r o u p R o w I d 	 	 i n t ,  
 	 	 	 	 M a n a g e m e n t G r o u p D e f a u l t N a m e 	 n v a r c h a r ( 5 1 2 )  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T e m p F i l t e r d M p s S r c  
 	 	 	 (  
 	 	 	 	 M a n a g e m e n t P a c k R o w I d 	 	 	 i n t  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T m p D a t a C o u n t s S r c  
 	 	 	 (  
 	 	 	 	 D a t a T y p e 	 	 	 	 	 i n t ,  
 	 	 	 	 M a n a g e m e n t P a c k R o w I d 	 	 	 i n t ,  
 	 	 	 	 S o u r c e T y p e I d 	 	 	 	 i n t ,  
 	 	 	 	 S o u r c e T y p e G u i d 	 	 	 	 u n i q u e i d e n t i f i e r ,  
 	 	 	 	 S o u r c e T y p e D i s p l a y 	 	 	 n v a r c h a r ( 5 1 2 ) ,  
 	 	 	 	 S o u r c e I d 	 	 	 	 	 i n t ,  
 	 	 	 	 S o u r c e G u i d 	 	 	 	 	 u n i q u e i d e n t i f i e r ,  
 	 	 	 	 S o u r c e D i s p l a y 	 	 	 	 n v a r c h a r ( 5 1 2 ) ,  
 	 	 	 	 S o u r c e P a t h F u l l N a m e 	 	 	 n v a r c h a r ( 5 1 2 ) , 	 	 	 	  
 	 	 	 	 D a t a C o u n t 	 	 	 	 	 b i g i n t  
 	 	 	 )  
  
 	 	 	 - - H A N D L E   E R R O R S  
 	 	         S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
     	 	 	  
 	 	 	 - -   O p t i o n   t o   u s e ,   c u r r e n t l y   f o r   A l e r t   D a t a   T y p e   a n d   i n   f u t u r e   w e   c a n   a d d   o t h e r   d a t a   t y p e . 	 	 	  
 	 	 	 I n s e r t   i n t o   # T m p O p s S r c  
 	 	 	 S e l e c t 	 O p t L i s t . O p t i o n I d . v a l u e ( ' . ' , ' i n t ' )   a s   O p t i o n I d  
 	 	 	 F r o m   @ D T X M L . n o d e s ( ' / * / V a l u e ' )   A s   O p t L i s t ( O p t i o n I d )  
 	 	 	 O r d e r   B y   O p t i o n I d  
  
 	 	 	 S e l e c t   @ S h o w A l e r t s   =   	 C a s e    
 	 	 	 	 	 	 	 	 	 	 W h e n   C o u n t ( O p t i o n I d )   >   0   T h e n   1    
 	 	 	 	 	 	 	 	 	 	 E L S E   0 	  
 	 	 	 	 	 	 	 	 	 E N D  
 	 	 	 	 	 	 	 	 	 F r o m   # T m p O p s S r c   w h e r e   O p t i o n I d   =   2  
 	 	         S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	 	 - - G e t   M o n i t o r   o r   R u l e   G u i d   t o   F i l t e r  
 	 	 	 I n s e r t   I n t o   # T m p M o n i t o r O r R u l e G u i d  
 	 	 	 S e l e c t     G u i d L i s t . M o n R u l G u i d . v a l u e ( ' . ' , ' u n i q u e i d e n t i f i e r ' )  
 	 	 	 F r o m   @ M o n i t o r O r R u l e G u i d . n o d e s ( ' / * / V a l u e ' )   A s   G u i d L i s t ( M o n R u l G u i d )  
 	 	 	 	 	 	 	 	 	  
 	 	 	 S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	 	 - - G e t   M p   T o   F i l t e r  
 	 	 	 I n s e r t   I n t o   # T m p M P s S r c  
 	 	 	 S e l e c t 	 M p . M a n a g e m e n t P a c k R o w I d ,  
 	 	 	 	 	 M p . M a n a g e m e n t P a c k S y s t e m N a m e  
 	 	 	 F r o m   @ M P X M L . n o d e s ( ' / * / V a l u e ' )   A s   M p L i s t ( M a n a g e m e n t P a c k G u i d )  
 	 	 	 I n n e r   J o i n   v M a n a g e m e n t P a c k   ( N o L o c k )   M p  
 	 	 	 O n   M p . M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d   =   M p L i s t . M a n a g e m e n t P a c k G u i d . v a l u e ( ' . ' , ' u n i q u e i d e n t i f i e r ' )  
 	 	 	 O r d e r   B y   M a n a g e m e n t P a c k R o w I d  
  
 	 	         S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	         - - G e t   M A N A G E M E N T   G R O U P S   T o   F i l t e r  
 	 	 	 I n s e r t   I n t o   # T m p M G P S r c  
 	 	 	 S e l e c t 	 M g p . M a n a g e m e n t G r o u p R o w I d ,  
 	 	 	 	 	 M g p . M a n a g e m e n t G r o u p D e f a u l t N a m e  
 	 	 	 F r o m   @ M G P X M L . n o d e s ( ' / * / V a l u e ' )   A s   M g p L i s t ( M a n a g e m e n t G r o u p G u i d )  
 	 	 	 I n n e r   J o i n   v M a n a g e m e n t G r o u p   ( N o L o c k )   M g p  
 	 	 	 O n   M g p . M a n a g e m e n t G r o u p G u i d   =   M g p L i s t . M a n a g e m e n t G r o u p G u i d . v a l u e ( ' . ' , ' u n i q u e i d e n t i f i e r ' )  
 	 	 	 O r d e r   B y   M a n a g e m e n t G r o u p R o w I d  
  
 	 	         S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	 	 - - G e t   F i l t e r e d   M a n a g e m e n t P a c k I d s  
 	 	 	 I n s e r t   i n t o   # T e m p F i l t e r d M p s S r c  
 	 	 	 S e l e c t   d i s t i n c t   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 F r o m   # T m p M P s S r c     M p c  
 	 	 	 I n n e r   J o i n   v M a n a g e m e n t P a c k V e r s i o n   M p v  
 	 	 	 O n   M p v . M a n a g e m e n t P a c k R o w I d   =   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 I n n e r   J o i n   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   M g m p v  
 	 	 	 O n   M g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   M p v . M a n a g e m e n t P a c k V e r s i o n R o w I d  
 	 	 	 I n n e r   J o i n   # T m p M G P S r c   ( N o L o c k )   M g p  
 	 	 	 O n   M g p . M a n a g e m e n t G r o u p R o w I d   =   M g m p v . M a n a g e m e n t G r o u p R o w I d  
 	 	 	 	  
 	 	 	 I f   @ S h o w A l e r t s 	 =   1  
 	 	 	 	 B E G I N  
 	 	 	 	 	 - - A l e r t s   C o u n t   b y   S o u r c e  
 	 	 	 	 	 I n s e r t   i n t o   # T m p D a t a C o u n t s S r c  
 	 	 	 	 	 S e l e c t 	 2   a s   D a t a T y p e ,  
 	 	 	 	 	 	 	 M p c . M a n a g e m e n t P a c k R o w I d ,  
 	 	 	 	 	 	 	 M t p . M a n a g e d E n t i t y T y p e R o w I d   a s   S o u r c e T y p e I d ,  
 	 	 	 	 	 	 	 M t p . M a n a g e d E n t i t y T y p e G u i d   a s   S o u r c e T y p e G u i d ,  
 	 	 	 	 	 	 	 C O A L E S C E ( L t p . N a m e , M t p . M a n a g e d E n t i t y T y p e D e f a u l t N a m e )   a s   S o u r c e T y p e D i s p l a y ,  
 	 	 	 	 	 	 	 M e t . M a n a g e d E n t i t y R o w I d   a s   S o u r c e I d ,  
 	 	 	 	 	 	 	 M e t . M a n a g e d E n t i t y G u i d   a s   S o u r c e G u i d ,  
 	 	 	 	 	 	 	 C O A L E S C E ( L o c . N a m e , M e t . D i s p l a y N a m e )   a s   S o u r c e D i s p l a y ,  
 	 	 	 	 	 	 	 C O A L E S C E ( M e t . P a t h , M e t . F u l l N a m e )   a s   S o u r c e P a t h F u l l N a m e ,  
 	 	 	 	 	 	 	 I s N u l l ( C o u n t ( D i s t i n c t   A l r . A l e r t G u i d ) , 0 )   a s   D a t a C o u n t  
 	 	 	 	 	 F r o m   A l e r t . v A l e r t   ( N o L o c k )   A l r    
 	 	 	 	 	 L E F T   O U T E R   J O I N   v M o n i t o r   ( N o L o c k )   M o n    
 	 	 	 	 	 O N   M o n . M o n i t o r R o w I d   =   A l r . W o r k f l o w R o w I d   	 	 	 	  
 	 	 	 	 	 A N D   A l r . M o n i t o r A l e r t I n d   =   1  
 	 	 	 	 	 L E F T   O U T E R   J O I N   v R u l e   R u l    
 	 	 	 	 	 O N   R u l . R u l e R o w I d   =   A l r . W o r k f l o w R o w I d    
 	 	 	 	 	 A N D   A l r . M o n i t o r A l e r t I n d   =   0  
 	 	 	 	 	 I n n e r   J o i n   # T e m p F i l t e r d M p s S r c     M p c  
 	 	 	 	 	 O n   M o n . M a n a g e m e n t P a c k R o w I d   =   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 	 	 O r   R u l . M a n a g e m e n t P a c k R o w I d   =   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 	 	 I n n e r   J o i n   # T m p M o n i t o r O r R u l e G u i d     g d  
 	 	 	 	 	 O n   M o n . M o n i t o r G u i d   =   g d . M o n R u l G u i d  
 	 	 	 	 	 O r   R u l . R u l e G u i d   =   g d . M o n R u l G u i d  
 	 	 	 	 	 I n n e r   J o i n   v M a n a g e d E n t i t y   ( N o L o c k )   M e t  
 	 	 	 	 	 O n   M e t . M a n a g e d E n t i t y R o w I d   =   A l r . M a n a g e d E n t i t y R o w I d  
 	 	 	 	 	 I n n e r   J o i n   # T m p M G P S r c   M g  
 	 	 	 	 	 O n   M e t . M a n a g e m e n t G r o u p R o w I d   =   M g . M a n a g e m e n t G r o u p R o w I d 	 	 	 	 	  
 	 	 	 	 	 I n n e r   J o i n   v M a n a g e d E n t i t y T y p e   ( N o L o c k )   M t p  
 	 	 	 	 	 O n   M t p . M a n a g e d E n t i t y T y p e R o w I d   =   M e t . M a n a g e d E n t i t y T y p e R o w I d  
 	 	 	 	 	 L e f t   O u t e r   J o i n   v D i s p l a y S t r i n g   ( N o L o c k )   L o c    
 	 	 	 	 	 O n   L o c . E l e m e n t G u i d   =   M e t . M a n a g e d E n t i t y G u i d  
 	 	 	 	 	 A n d   L o c . L a n g u a g e C o d e   =   @ L a n g u a g e C o d e  
 	 	 	 	 	 L e f t   O u t e r   J o i n   v D i s p l a y S t r i n g   ( N o L o c k )   L t p    
 	 	 	 	 	 O n   L t p . E l e m e n t G u i d   =   M t p . M a n a g e d E n t i t y T y p e G u i d  
 	 	 	 	 	 A n d   L t p . L a n g u a g e C o d e   =   @ L a n g u a g e C o d e  
 	 	 	 	 	 w h e r e   A l r . R a i s e d D a t e T i m e   B E T W E E N   @ S t a r t D a t e   A N D   @ E n d D a t e   	 	 	 	 	  
 	 	 	 	 	 G r o u p   B y   M p c . M a n a g e m e n t P a c k R o w I d ,   L o c . N a m e , L t p . N a m e , M t p . M a n a g e d E n t i t y T y p e R o w I d ,   M t p . M a n a g e d E n t i t y T y p e G u i d ,   M t p . M a n a g e d E n t i t y T y p e D e f a u l t N a m e ,   M e t . M a n a g e d E n t i t y R o w I d , M e t . M a n a g e d E n t i t y G u i d ,   M e t . D i s p l a y N a m e ,   M e t . P a t h ,   M e t . F u l l N a m e  
 	 	 	 	 E N D  
  
 	 	         S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
 	 	 	  
 	 	 	 - - F i n a l   R e s u l t s  
 	 	 	 S e l e c t    
 	 	 	 	 R O W _ N U M B E R ( )   O V E R ( O R D E R   B Y   C n t s . C o u n t B y S o u r c e   D e s c )   A S   ' R o w N u m b e r ' ,  
 	 	 	 	 C n t s . S o u r c e I d ,  
 	 	 	 	 C n t s . S o u r c e G u i d ,  
 	 	 	 	 C n t s . S o u r c e D i s p l a y ,  
 	 	 	 	 C n t s . S o u r c e T y p e I d ,  
 	 	 	 	 C n t s . S o u r c e T y p e G u i d ,  
 	 	 	 	 C n t s . S o u r c e T y p e D i s p l a y ,  
 	 	 	 	 C n t s . S o u r c e P a t h F u l l N a m e ,  
 	 	 	 	 C n t s . C o u n t B y S o u r c e  
 	 	 	 F r o m 	 	  
 	 	 	 (  
 	 	 	 	 S e l e c t 	 D a t a T y p e ,  
 	 	 	 	 	 	 S o u r c e I d ,  
 	 	 	 	 	 	 S o u r c e G u i d ,  
 	 	 	 	 	 	 S o u r c e D i s p l a y ,  
 	 	 	 	 	 	 S o u r c e T y p e I d ,  
 	 	 	 	 	 	 S o u r c e T y p e G u i d ,  
 	 	 	 	 	 	 S o u r c e T y p e D i s p l a y ,  
 	 	 	 	 	 	 S o u r c e P a t h F u l l N a m e , 	 	 	 	 	 	  
 	 	 	 	 	 	 S u m ( I s N u l l ( D a t a C o u n t , 0 ) )   a s   C o u n t B y S o u r c e  
 	 	 	 	 F r o m   # T m p D a t a C o u n t s S r c   C n t S r c 	 	 	 	  
 	 	 	 	 G r o u p   B y   D a t a T y p e ,  
 	 	 	 	 	 	   S o u r c e I d ,  
 	 	 	 	 	 	   S o u r c e G u i d ,    
 	 	 	 	 	 	   S o u r c e D i s p l a y ,  
 	 	 	 	 	 	   S o u r c e T y p e I d ,  
 	 	 	 	 	 	   S o u r c e T y p e G u i d ,  
 	 	 	 	 	 	   S o u r c e T y p e D i s p l a y ,  
 	 	 	 	 	 	   S o u r c e P a t h F u l l N a m e  
 	 	 	 )   A s   C n t s   	 	 	  
 	 	 	 O r d e r   b y   C n t s . C o u n t B y S o u r c e   D e s c  
      
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   E R R O R   H A N D E L I N G   A N D   T E M P   C L E A N U P  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 Q u i t E r r o r :  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p O p s S r c ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 D r o p   T a b l e   # T m p O p s S r c  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p M o n i t o r O r R u l e G u i d ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 D r o p   T a b l e   # T m p M o n i t o r O r R u l e G u i d  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p M P s S r c ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 D r o p   T a b l e   # T m p M P s S r c  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p M G P S r c ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 D r o p   T a b l e   # T m p M G P S r c  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T e m p F i l t e r d M p s S r c ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 D r o p   T a b l e   # T e m p F i l t e r d M p s S r c  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p D a t a C o u n t s S r c ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 D r o p   T a b l e   # T m p D a t a C o u n t s S r c  
               E N D  
                
       	 R E T U R N   @ E r r o r  
  
 E N D  
 G O  
  
 G R A N T   E X E C U T E   O N   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t A l e r t s S o u r c e I n f o ]   T O   O p s M g r R e a d e r  
 G O  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   C R E A T E   P R O C E D U R E  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s o b j e c t s   W H E R E   t y p e   =   ' P '   A N D   n a m e   =   ' M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t D a t a P e r M P ' )  
 	 B E G I N  
 	 	 E X E C U T E   ( ' C R E A T E   P R O C E D U R E   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t D a t a P e r M P ]   A S   R E T U R N   1 ' )  
 	 E N D  
 G O  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   A L T E R   P R O C E D U R E  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 A L T E R   P R O C E D U R E   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t D a t a P e r M P ]    
 	 	 @ S t a r t D a t e 	 	 D a t e t i m e ,  
 	 	 @ E n d D a t e 	 	 D a t e t i m e , 	 	  
 	 	 @ D T X M L 	 	 	 x m l ,  
 	 	 @ M G P X M L 	 	 	 x m l ,  
 	 	 @ M i n C o u n t 	 	 i n t ,  
 	 	 @ L a n g u a g e C o d e       v a r c h a r ( 3 )  
 	 	  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   D E C L A R E   L O C A L   V A R I A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = 	  
 	 D e c l a r e 	 @ E r r o r 	 	 	 i n t ,  
 	                 @ S h o w A l e r t s 	 	 b i t 	 	 	  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   C R E A T E   T E M P   T A B L E S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 	 	 	 C r e a t e   T a b l e   # T m p O p t s  
 	 	 	 (  
 	 	 	 	 O p t i o n I d 	 i n t  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T m p M P  
 	 	 	 (  
 	 	 	 	 M a n a g e m e n t P a c k R o w I d 	 	 	 	 	 	 i n t ,  
 	 	 	 	 M a n a g e m e n t P a c k D e f a u l t N a m e 	 	 	 	 n v a r c h a r ( 5 1 2 ) ,  
 	 	 	 	 M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d 	 u n i q u e i d e n t i f i e r  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T m p M G P  
 	 	 	 (  
 	 	 	 	 M a n a g e m e n t G r o u p R o w I d 	 	 i n t ,  
 	 	 	 	 M a n a g e m e n t G r o u p D e f a u l t N a m e 	 n v a r c h a r ( 5 1 2 )  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T e m p F i l t e r d M p s  
 	 	 	 (  
 	 	 	 	 M a n a g e m e n t P a c k R o w I d 	 	 	 i n t  
 	 	 	 )  
  
 	 	 	 C r e a t e   T a b l e   # T m p D a t a C o u n t s  
 	 	 	 (  
 	 	 	 	 D a t a T y p e 	 	 	 	 	 i n t ,  
 	 	 	 	 M a n a g e m e n t P a c k R o w I d 	 	 	 i n t , 	 	 	 	  
 	 	 	 	 D a t a C o u n t 	 	 	 	 	 b i g i n t  
 	 	 	 )  
  
 	 	 	 - - H A N D L E   E R R O R S  
 	 	         S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	 	 - - O p t i o n s   t o   U s e   f o r   d a t a   t y p e   ( c u r r e n t l y   o n l y   f o r   A l e r t s   a n d   i n   f u t u r e   c a n   a d d   o t h e r   d a t a   t y p e )  
 	 	 	 I n s e r t   i n t o   # T m p O p t s  
 	 	 	 S e l e c t 	 O p t L i s t . O p t i o n I d . v a l u e ( ' . ' , ' i n t ' )   a s   O p t i o n I d  
 	 	 	 F r o m   @ D T X M L . n o d e s ( ' / * / V a l u e ' )   A s   O p t L i s t ( O p t i o n I d )  
 	 	 	 O r d e r   B y   O p t i o n I d  
  
 	 	 	 S e l e c t   @ S h o w A l e r t s   =   	 C a s e    
 	 	 	 	 	 	 	 	 	 	 W h e n   C o u n t ( O p t i o n I d )   >   0   T h e n   1    
 	 	 	 	 	 	 	 	 	 	 E L S E   0 	  
 	 	 	 	 	 	 	 	 	 E N D  
 	 	 	 	 	 	 	 	 	 F r o m   # T m p O p t s   w h e r e   O p t i o n I d   =   2  
  
 	 	 	 S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	         - - G e t   M p   T o   F i l t e r  
 	 	 	 I n s e r t   I n t o   # T m p M P  
 	 	 	 S e l e c t 	 M p . M a n a g e m e n t P a c k R o w I d ,  
 	 	 	 	 	 M p . M a n a g e m e n t P a c k D e f a u l t N a m e ,    
 	 	 	 	 	 M p . M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d  
 	 	 	 F r o m   v M a n a g e m e n t P a c k   ( N o L o c k )   M p 	 	 	  
 	 	 	 O r d e r   B y   M a n a g e m e n t P a c k R o w I d  
  
 	 	         S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	         - - G e t   M A N A G E M E N T   G R O U P S   T o   F i l t e r  
 	 	 	 I n s e r t   I n t o   # T m p M G P  
 	 	 	 S e l e c t 	 M g p . M a n a g e m e n t G r o u p R o w I d ,  
 	 	 	 	 	 M g p . M a n a g e m e n t G r o u p D e f a u l t N a m e  
 	 	 	 F r o m   @ M G P X M L . n o d e s ( ' / * / V a l u e ' )   A s   M g p L i s t ( M a n a g e m e n t G r o u p G u i d )  
 	 	 	 I n n e r   J o i n   v M a n a g e m e n t G r o u p   ( N o L o c k )   M g p  
 	 	 	 O n   M g p . M a n a g e m e n t G r o u p G u i d   =   M g p L i s t . M a n a g e m e n t G r o u p G u i d . v a l u e ( ' . ' , ' u n i q u e i d e n t i f i e r ' )  
 	 	 	 O r d e r   B y   M a n a g e m e n t G r o u p R o w I d  
  
 	 	 	 S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	 	 - - G e t   F i l t e r e d   M a n a g e m e n t P a c k I d s  
 	 	 	 I n s e r t   i n t o   # T e m p F i l t e r d M p s  
 	 	 	 S e l e c t   d i s t i n c t   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 F r o m   # T m p M P     M p c  
 	 	 	 I n n e r   J o i n   v M a n a g e m e n t P a c k V e r s i o n   M p v  
 	 	 	 O n   M p v . M a n a g e m e n t P a c k R o w I d   =   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 I n n e r   J o i n   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   M g m p v  
 	 	 	 O n   M g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   M p v . M a n a g e m e n t P a c k V e r s i o n R o w I d  
 	 	 	 I n n e r   J o i n   # T m p M G P   ( N o L o c k )   M g p  
 	 	 	 O n   M g p . M a n a g e m e n t G r o u p R o w I d   =   M g m p v . M a n a g e m e n t G r o u p R o w I d  
  
 	 	 	 - - A l e r t s   C o u n t   b y   M P  
 	 	 	 I f   @ S h o w A l e r t s 	 =   1  
 	 	 	 	 B E G I N  
 	 	 	 	 	 - - A l e r t s   C o u n t   B y   M P  
 	 	 	 	 	 I n s e r t   i n t o   # T m p D a t a C o u n t s  
 	 	 	 	 	 S e l e c t 	 2   a s   D a t a T y p e ,  
 	 	 	 	 	 	 	 I s N u l l ( M o n . M a n a g e m e n t P a c k R o w I d ,   R u l . M a n a g e m e n t P a c k R o w I d )   a s   M a n a g e m e n t P a c k R o w I d , 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 I s N u l l ( C o u n t ( D i s t i n c t   A l r . A l e r t G u i d ) , 0 )   a s   D a t a C o u n t  
 	 	 	 	 	 F r o m   A l e r t . v A l e r t   ( N o L o c k )   A l r    
 	 	 	 	 	 L E F T   O U T E R   J O I N   v M o n i t o r   ( N o L o c k )   M o n    
 	 	 	 	 	 O N   M o n . M o n i t o r R o w I d   =   A l r . W o r k f l o w R o w I d   	 	 	 	  
 	 	 	 	 	 A N D   A l r . M o n i t o r A l e r t I n d   =   1  
 	 	 	 	 	 L E F T   O U T E R   J O I N   v R u l e   R u l    
 	 	 	 	 	 O N   R u l . R u l e R o w I d   =   A l r . W o r k f l o w R o w I d    
 	 	 	 	 	 A N D   A l r . M o n i t o r A l e r t I n d   =   0  
 	 	 	 	 	 I n n e r   J o i n   v M a n a g e d E n t i t y   M e t  
 	 	 	 	 	 O n   M e t . M a n a g e d E n t i t y R o w I d   =   A l r . M a n a g e d E n t i t y R o w I d  
 	 	 	 	 	 I n n e r   J o i n   # T m p M G P   M g  
 	 	 	 	 	 O n   M e t . M a n a g e m e n t G r o u p R o w I d   =   M g . M a n a g e m e n t G r o u p R o w I d 	 	 	 	 	 	 	 	 	 	  
 	 	 	 	 	 I n n e r   J o i n   # T e m p F i l t e r d M p s     M p c  
 	 	 	 	 	 O n   M o n . M a n a g e m e n t P a c k R o w I d   =   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 	 	 O r   R u l . M a n a g e m e n t P a c k R o w I d   =   M p c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 	 	 w h e r e   A l r . R a i s e d D a t e T i m e   B E T W E E N   @ S t a r t D a t e   A N D   @ E n d D a t e    
 	 	 	 	 	 G r o u p   B y   I s N u l l ( M o n . M a n a g e m e n t P a c k R o w I d , R u l . M a n a g e m e n t P a c k R o w I d )  
 	 	 	 	 E N D  
  
 	 	 	 S E T   @ E r r o r   =   @ @ E R R O R  
 	 	 	 I F   @ E r r o r   < >   0   G O T O   Q u i t E r r o r  
  
 	 	 	 - - F i n a l   R e s u l t s  
 	 	 	 S e l e c t 	  
 	 	 	 	 R O W _ N U M B E R ( )   O V E R ( O R D E R   B Y   C n t s . A l e r t C o u n t   D e s c )   A S   ' R o w N u m b e r ' ,  
 	 	 	 	 C n t s . M a n a g e m e n t P a c k R o w I d , 	 	 	 	  
 	 	 	 	 C n t s . M a n a g e m e n t P a c k S y s t e m N a m e ,  
 	 	 	 	 C n t s . M a n a g e m e n t P a c k I n d e p e n d e n t G u i d ,  
 	 	 	 	 C n t s . A l e r t C o u n t 	 	 	 	  
 	 	 	 F r o m 	 	  
 	 	 	 (  
 	 	 	 	 S e l e c t 	 M p . M a n a g e m e n t P a c k R o w I d ,  
 	 	 	 	 	 	 M p . M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d   a s   M a n a g e m e n t P a c k I n d e p e n d e n t G u i d ,  
 	 	 	 	 	 	 I s N u l l ( L o c . N a m e ,   M p . M a n a g e m e n t P a c k D e f a u l t N a m e )   a s   M a n a g e m e n t P a c k S y s t e m N a m e , 	 	 	 	 	 	  
 	 	 	 	 	 	 I s N u l l ( A l D c . D a t a C o u n t , 0 )     a s   A l e r t C o u n t  
 	 	 	 	 F r o m   # T m p M P   ( N o L o c k )   M p    
 	 	 	 	 L e f t   O u t e r   J o i n   v D i s p l a y S t r i n g   ( N o L o c k )   L o c    
 	 	 	 	 O n   M p . M a n a g e m e n t P a c k V e r s i o n I n d e p e n d e n t G u i d   =   L o c . E l e m e n t G u i d  
 	 	 	 	 A n d   L o c . L a n g u a g e C o d e   =   @ L a n g u a g e C o d e  
 	 	 	 	 L e f t   O u t e r   J o i n  
 	 	 	 	 (  
 	 	 	 	 	 S e l e c t 	 M a n a g e m e n t P a c k R o w I d ,  
 	 	 	 	 	 	 	 S u m ( D a t a C o u n t )   a s   D a t a C o u n t  
 	 	 	 	 	 F r o m   # T m p D a t a C o u n t s    
 	 	 	 	 	 W h e r e   D a t a T y p e   =   2  
 	 	 	 	 	 G r o u p   B y   M a n a g e m e n t P a c k R o w I d ,   D a t a T y p e  
 	 	 	 	 )   A s   A l D c  
 	 	 	 	 O n   M p . M a n a g e m e n t P a c k R o w I d   =   A l D c . M a n a g e m e n t P a c k R o w I d  
 	 	 	 )   A s   C n t s   	 	 	  
 	 	 	 W h e r e   C n t s . A l e r t C o u n t   > =   @ M i n C o u n t  
 	 	 	 O r d e r   b y   C n t s . A l e r t C o u n t   D e s c  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   E R R O R   H A N D E L I N G   A N D   T E M P   C L E A N U P  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 Q u i t E r r o r :  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p O p t s ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 d r o p   t a b l e   # T m p O p t s  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p M P ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 d r o p   t a b l e   # T m p M P  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p M G P ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 d r o p   t a b l e   # T m p M G P  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T e m p F i l t e r d M p s ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 d r o p   t a b l e   # T e m p F i l t e r d M p s  
               E N D  
  
 	 I F   O B J E C T _ I D ( ' t e m p d b . . # T m p D a t a C o u n t s ' )   I S   N O T   N U L L      
               B E G I N  
 	 	 	 d r o p   t a b l e   # T m p D a t a C o u n t s  
               E N D  
  
       	 R E T U R N   @ E r r o r  
      
 E N D  
 G O  
  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 - -   P E R M I S S I O N S  
 - - = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =  
 G R A N T   E X E C U T E   O N   S D K . [ M i c r o s o f t _ S y s t e m C e n t e r _ D a t a W a r e h o u s e _ G e t D a t a P e r M P ]   T O   O p s M g r R e a d e r  
 G O  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s o b j e c t s   W H E R E   t y p e   =   ' P '   A N D   n a m e   =   ' A l e r t G r o o m ' )  
 	 B E G I N  
 	 	 E X E C U T E   ( ' C R E A T E   P R O C E D U R E   d b o . A l e r t G r o o m   A S   R E T U R N   1 ' )  
 	 E N D  
 G O  
  
 A L T E R   P R O C E D U R E   d b o . A l e r t G r o o m  
       @ D a t a s e t I d       u n i q u e i d e n t i f i e r  
     , @ A g g r e g a t i o n T y p e I d   t i n y i n t  
     , @ T a b l e G u i d   u n i q u e i d e n t i f i e r  
     , @ C u t o f f D a t e T i m e   d a t e t i m e  
     , @ M a x R o w s T o G r o o m   i n t  
     , @ R o w s D e l e t e d   i n t   O U T P U T  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
  
     D E C L A R E    
           @ E r r o r I n d                 b i t  
         , @ E r r o r M e s s a g e         n v a r c h a r ( 4 0 0 0 )  
         , @ E r r o r N u m b e r           i n t  
         , @ E r r o r S e v e r i t y       i n t  
         , @ E r r o r S t a t e             i n t  
         , @ E r r o r L i n e               i n t  
         , @ E r r o r P r o c e d u r e     n v a r c h a r ( 2 5 6 )  
         , @ E r r o r M e s s a g e T e x t   n v a r c h a r ( 4 0 0 0 )  
  
     S E T   @ E r r o r I n d   =   0  
      
     D E C L A R E  
           @ M a i n T a b l e N a m e   v a r c h a r ( 2 5 5 )  
         , @ T a b l e N a m e   v a r c h a r ( 2 5 5 )  
         , @ S t a t e m e n t   v a r c h a r ( m a x )  
         , @ D e b u g L e v e l   t i n y i n t  
         , @ S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d   i n t  
         , @ S c h e m a N a m e   s y s n a m e  
      
     B E G I N   T R Y  
         S E L E C T  
               @ D e b u g L e v e l   =   D e b u g L e v e l  
             , @ S c h e m a N a m e   =   S c h e m a N a m e  
         F R O M   S t a n d a r d D a t a s e t  
         W H E R E   D a t a s e t I d   =   @ D a t a s e t I d  
  
         B E G I N   T R A N  
          
         C R E A T E   T A B L E   # A l e r t G r o o m   (  
             A l e r t G u i d   u n i q u e i d e n t i f i e r   N O T   N U L L  
         )  
          
         S E L E C T   @ M a i n T a b l e N a m e   =   B a s e T a b l e N a m e   +   ' _ '   +   R E P L A C E ( C A S T ( @ T a b l e G u i d   A S   v a r c h a r ( 5 0 ) ) ,   ' - ' ,   ' ' )  
         F R O M   S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e  
         W H E R E   ( D a t a s e t I d   =   @ D a t a s e t I d )  
             A N D   ( A g g r e g a t i o n T y p e I d   =   @ A g g r e g a t i o n T y p e I d )  
             A N D   ( D e p e n d e n t T a b l e I n d   =   0 )  
          
         S E T   @ S t a t e m e n t   =   ' I N S E R T   # A l e r t G r o o m   ( A l e r t G u i d ) '  
                                       +   '   S E L E C T   T O P   '   +   C A S T ( @ M a x R o w s T o G r o o m   A S   v a r c h a r ( 1 5 ) )   +   '   A l e r t G u i d '  
                                       +   '   F R O M   '   +   Q U O T E N A M E ( @ S c h e m a N a m e )   +   ' . '   +   Q U O T E N A M E ( @ M a i n T a b l e N a m e )  
                                       +   '   W H E R E   ( [ D a t e T i m e ]   <   C O N V E R T ( d a t e t i m e ,   ' ' '   +   C O N V E R T ( v a r c h a r ( 5 0 ) ,   @ C u t o f f D a t e T i m e ,   1 2 0 )   +   ' ' ' ,   1 2 0 ) ) '  
                                        
         E X E C U T E   ( @ S t a t e m e n t )  
  
         S E T   @ S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d   =   0  
          
         W H I L E   E X I S T S   ( S E L E C T   *  
                                     F R O M   S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e  
                                     W H E R E   ( D a t a s e t I d   =   @ D a t a s e t I d )  
                                         A N D   ( A g g r e g a t i o n T y p e I d   =   @ A g g r e g a t i o n T y p e I d )  
                                         A N D   ( D e p e n d e n t T a b l e I n d   =   1 )  
                                         A N D   ( S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d   >   @ S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d )  
                                   )  
         B E G I N  
             S E L E C T   T O P   1  
                   @ S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d   =   S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d  
                 , @ T a b l e N a m e   =   B a s e T a b l e N a m e   +   ' _ '   +   R E P L A C E ( C A S T ( @ T a b l e G u i d   A S   v a r c h a r ( 5 0 ) ) ,   ' - ' ,   ' ' )  
             F R O M   S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e  
             W H E R E   ( D a t a s e t I d   =   @ D a t a s e t I d )  
                 A N D   ( A g g r e g a t i o n T y p e I d   =   @ A g g r e g a t i o n T y p e I d )  
                 A N D   ( D e p e n d e n t T a b l e I n d   =   1 )  
                 A N D   ( S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d   >   @ S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d )  
 	 	 O r d e r   B y   S t a n d a r d D a t a s e t A g g r e g a t i o n S t o r a g e R o w I d   A s c  
                  
             S E T   @ S t a t e m e n t   =   ' D E L E T E   d '  
                                           +   '   F R O M   '   +   Q U O T E N A M E ( @ S c h e m a N a m e )   +   ' . '   +   Q U O T E N A M E ( @ T a b l e N a m e )   +   '   d '  
                                           +   '       J O I N   # A l e r t G r o o m   a   O N   ( d . A l e r t G u i d   =   a . A l e r t G u i d ) '  
             E X E C U T E   ( @ S t a t e m e n t )  
         E N D  
          
         S E T   @ S t a t e m e n t   =   ' D E L E T E   d '  
                                       +   '   F R O M   '   +   Q U O T E N A M E ( @ S c h e m a N a m e )   +   ' . '   +   Q U O T E N A M E ( @ M a i n T a b l e N a m e )   +   '   d '  
                                       +   '       J O I N   # A l e r t G r o o m   a   O N   ( d . A l e r t G u i d   =   a . A l e r t G u i d ) '  
         E X E C U T E   ( @ S t a t e m e n t )  
         S E T   @ R o w s D e l e t e d   =   @ @ R O W C O U N T  
          
         D R O P   T A B L E   # A l e r t G r o o m  
          
         C O M M I T  
  
         - -   g r o o m   s t a g i n g   o f   d a t a   f o r   r e j e c t e d   M G s  
         D E L E T E   A l e r t . A l e r t S t a g e  
         W H E R E   M a n a g e m e n t G r o u p G u i d   N O T   I N   ( S E L E C T   M a n a g e m e n t G r o u p G u i d  
                                                                             F R O M   M a n a g e m e n t G r o u p   m g  
                                                                             W H E R E   ( C o n n e c t C o n f i r m e d D a t e T i m e   I S   N O T   N U L L )  
                                                                                 A N D   ( C o n n e c t R e j e c t e d I n d   =   0 )  
                                                                           )  
     E N D   T R Y  
     B E G I N   C A T C H  
         I F   ( @ @ T R A N C O U N T   >   0 )  
             R O L L B A C K   T R A N  
  
         S E L E C T    
               @ E r r o r N u m b e r   =   E R R O R _ N U M B E R ( )  
             , @ E r r o r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
             , @ E r r o r S t a t e   =   E R R O R _ S T A T E ( )  
             , @ E r r o r L i n e   =   E R R O R _ L I N E ( )  
             , @ E r r o r P r o c e d u r e   =   I S N U L L ( E R R O R _ P R O C E D U R E ( ) ,   ' - ' )  
             , @ E r r o r M e s s a g e T e x t   =   E R R O R _ M E S S A G E ( )  
  
         S E T   @ E r r o r I n d   =   1  
     E N D   C A T C H  
          
     - -   r e p o r t   e r r o r   i f   a n y  
     I F   ( @ E r r o r I n d   =   1 )  
     B E G I N  
         I F   ( @ D e b u g L e v e l   >   0 )  
         B E G I N  
             D E C L A R E   @ D e b u g M e s s a g e T e x t   n v a r c h a r ( m a x )  
  
             S E T   @ D e b u g M e s s a g e T e x t   =   N ' F a i l e d   t o   g r o o m   d a t a   f o r   A l e r t   d a t a   s e t .   E r r o r   '   +   C A S T ( @ E r r o r N u m b e r   A S   v a r c h a r ( 1 5 ) )  
                                             +   ' ,   P r o c e d u r e   '   +   @ E r r o r P r o c e d u r e  
                                             +   ' ,   L i n e   '   +   C A S T ( @ E r r o r L i n e   A S   v a r c h a r ( 1 5 ) )  
                                             +   ' ,   M e s s a g e :   ' +   @ E r r o r M e s s a g e T e x t  
  
             E X E C   D e b u g M e s s a g e I n s e r t  
                   @ D a t a s e t I d   =   @ D a t a s e t I d  
                 , @ M e s s a g e L e v e l   =   1  
                 , @ M e s s a g e T e x t   =   @ D e b u g M e s s a g e T e x t  
         E N D  
              
         D E C L A R E   @ A d j u s t e d E r r o r S e v e r i t y   i n t  
  
         S E T   @ A d j u s t e d E r r o r S e v e r i t y   =   C A S E  
                                                                       W H E N   @ E r r o r S e v e r i t y   >   1 8   T H E N   1 8  
                                                                       E L S E   @ E r r o r S e v e r i t y  
                                                                   E N D  
          
         R A I S E R R O R   ( 7 7 7 9 7 1 0 0 2 ,   @ A d j u s t e d E r r o r S e v e r i t y ,   1  
             , @ E r r o r N u m b e r  
             , @ E r r o r S e v e r i t y  
             , @ E r r o r S t a t e  
             , @ E r r o r P r o c e d u r e  
             , @ E r r o r L i n e  
             , @ E r r o r M e s s a g e T e x t  
         )  
     E N D  
      
     R E T U R N   @ R o w s D e l e t e d  
 E N D  
 G O  
         I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s o b j e c t s   W H E R E   t y p e   =   ' P '   A N D   n a m e   =   ' G e t S e r v i c e L e v e l I n f o r m a t i o n D a t a ' )  
 B E G I N  
     E X E C U T E   ( ' C R E A T E   P R O C E D U R E   s d k . [ G e t S e r v i c e L e v e l I n f o r m a t i o n D a t a ]   A S   R E T U R N   1 ' )  
 E N D  
 G O  
  
 A L T E R   P R O C E D U R E   [ s d k ] . [ G e t S e r v i c e L e v e l I n f o r m a t i o n D a t a ]  
           @ S t a r t D a t e                                           d a t e t i m e  
         , @ E n d D a t e                                               d a t e t i m e  
         , @ S e r v i c e L e v e l A g r e e m e n t X m l             x m l   =   N U L L  
         , @ A g g r e g a t i o n T y p e I d                           i n t  
         , @ M a n a g e m e n t G r o u p I d                           u n i q u e i d e n t i f i e r  
         , @ L a n g u a g e C o d e                             v a r c h a r ( 3 )   =   ' E N U '  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
      
     D E C L A R E    
           @ E r r o r I n d                 b i t  
         , @ E r r o r M e s s a g e         n v a r c h a r ( m a x )  
         , @ E r r o r N u m b e r           i n t  
         , @ E r r o r S e v e r i t y       i n t  
         , @ E r r o r S t a t e             i n t  
         , @ E r r o r L i n e               i n t  
         , @ E r r o r P r o c e d u r e     n v a r c h a r ( 2 5 6 )  
         , @ E r r o r M e s s a g e T e x t   n v a r c h a r ( m a x )  
  
     S E T   @ E r r o r I n d   =   0  
      
     D E C L A R E  
           @ C o n t a i n m e n t R e l a t i o n s h i p T y p e R o w I d   i n t  
         , @ L e v e l   i n t  
         , @ R o w C o u n t   i n t  
      
     B E G I N   T R Y  
         - -   b u i l d   a   l i s t   o f   a l l   e n t i t i e s   c o v e r e d   b y   S l a ' s  
         C R E A T E   T A B L E   # S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y   (  
               S e r v i c e L e v e l A g r e e m e n t R o w I d           i n t           N O T   N U L L  
             , M a n a g e m e n t G r o u p R o w I d                       i n t           N O T   N U L L  
             , T a r g e t M a n a g e d E n t i t y T y p e R o w I d       i n t           N U L L  
             , C o n t e x t M a n a g e d E n t i t y T y p e R o w I d     i n t           N U L L  
             , C o n t e x t M a n a g e d E n t i t y G u i d               u n i q u e i d e n t i f i e r     N U L L  
             , M a n a g e d E n t i t y R o w I d                           i n t           N O T   N U L L  
         )  
          
         I N S E R T   # S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y  
         E X E C   [ s d k ] . [ S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y G e t ]  
                     @ S t a r t D a t e  
                   , @ E n d D a t e  
                   , @ S e r v i c e L e v e l A g r e e m e n t X m l  
                   , @ M a n a g e m e n t G r o u p I d      
                    
         - -   b u i l d   l i s t   o f   S l o ' s   c o v e r e d   b y   g i v e n   S l a ' s  
         C R E A T E   T A B L E   # S e r v i c e L e v e l O b j e c t i v e   (  
               S e r v i c e L e v e l A g r e e m e n t R o w I d           i n t                   N O T   N U L L  
             , M a n a g e m e n t G r o u p R o w I d                       i n t                   N O T   N U L L  
             , S e r v i c e L e v e l O b j e c t i v e R o w I d           i n t                   N O T   N U L L  
             , T a r g e t M a n a g e d E n t i t y T y p e R o w I d       i n t                   N O T   N U L L  
             , G o a l                                                       f l o a t               N O T   N U L L  
             , D e s i r e d O b j e c t i v e                               v a r c h a r ( 5 )     N O T   N U L L  
             , A g g r e g a t i o n M e t h o d                             c h a r ( 3 )           N O T   N U L L  
         )  
          
         I N S E R T   # S e r v i c e L e v e l O b j e c t i v e  
         E X E C   [ s d k ] . [ S e r v i c e L e v e l O b j e c t i v e G e t B y S e r v i c e L e v e l A g r e e m e n t ]  
                     @ S t a r t D a t e  
                   , @ E n d D a t e  
                   , @ S e r v i c e L e v e l A g r e e m e n t X m l  
                   , @ M a n a g e m e n t G r o u p I d  
  
  
         - -   b u i l d   a   l i s t   o f   a l l   c o n t a i n m e n t   r e l a t i o n s h i p s  
         C R E A T E   T A B L E   # C o n t a i n m e n t R e l a t i o n s h i p T y p e   (  
               R e l a t i o n s h i p T y p e R o w I d     i n t   P R I M A R Y   K E Y  
         )  
          
         S E L E C T   @ C o n t a i n m e n t R e l a t i o n s h i p T y p e R o w I d   =   R e l a t i o n s h i p T y p e R o w I d  
         F R O M   R e l a t i o n s h i p T y p e  
         W H E R E   R e l a t i o n s h i p T y p e S y s t e m N a m e   =   ' S y s t e m . C o n t a i n m e n t '  
          
         I F   ( @ C o n t a i n m e n t R e l a t i o n s h i p T y p e R o w I d   I S   N O T   N U L L )  
         B E G I N  
             I N S E R T   # C o n t a i n m e n t R e l a t i o n s h i p T y p e   ( R e l a t i o n s h i p T y p e R o w I d )  
             S E L E C T   R e l a t i o n s h i p T y p e R o w I d  
             F R O M   d b o . R e l a t i o n s h i p D e r i v e d T y p e H i e r a r c h y ( @ C o n t a i n m e n t R e l a t i o n s h i p T y p e R o w I d ,   0 )  
         E N D  
          
         - -   w a l k   d o w n   t h e   c o n t a i n m e n t   r e l a t i o n s h i p   f o r   S l a   e n t i t i e s  
         C R E A T E   T A B L E   # C o n t a i n e d M a n a g e d E n t i t y   (  
               S e r v i c e L e v e l A g r e e m e n t R o w I d           i n t           N O T   N U L L  
             , M a n a g e m e n t G r o u p R o w I d                       i n t           N O T   N U L L  
             , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d   i n t   N O T   N U L L  
             , M a n a g e d E n t i t y R o w I d                           i n t           N O T   N U L L  
             , [ L e v e l ]                                                 i n t           N O T   N U L L  
         )  
          
         I N S E R T   # C o n t a i n e d M a n a g e d E n t i t y   (  
                   S e r v i c e L e v e l A g r e e m e n t R o w I d  
                 , M a n a g e m e n t G r o u p R o w I d  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                 , M a n a g e d E n t i t y R o w I d  
                 , [ L e v e l ]  
         )  
         S E L E C T  
               s l a . S e r v i c e L e v e l A g r e e m e n t R o w I d  
             , s l a . M a n a g e m e n t G r o u p R o w I d  
             , s l a . M a n a g e d E n t i t y R o w I d  
             , s l a . M a n a g e d E n t i t y R o w I d  
             , 0  
         F R O M   # S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y   s l a  
  
         S E T   @ L e v e l   =   1  
         S E T   @ R o w C o u n t   =   1  
          
         W H I L E   ( @ R o w C o u n t   >   0 )  
         B E G I N  
             I N S E R T   # C o n t a i n e d M a n a g e d E n t i t y   (  
                   S e r v i c e L e v e l A g r e e m e n t R o w I d  
                 , M a n a g e m e n t G r o u p R o w I d  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                 , M a n a g e d E n t i t y R o w I d  
                 , [ L e v e l ]  
             )  
             S E L E C T  
                   s o u r c e _ m e . S e r v i c e L e v e l A g r e e m e n t R o w I d  
                 , s o u r c e _ m e . M a n a g e m e n t G r o u p R o w I d  
                 , s o u r c e _ m e . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                 , r . T a r g e t M a n a g e d E n t i t y R o w I d  
                 , @ L e v e l  
             F R O M   # C o n t a i n e d M a n a g e d E n t i t y   s o u r c e _ m e  
                         J O I N   v R e l a t i o n s h i p   r   O N   ( s o u r c e _ m e . M a n a g e d E n t i t y R o w I d   =   r . S o u r c e M a n a g e d E n t i t y R o w I d )  
                         J O I N   # C o n t a i n m e n t R e l a t i o n s h i p T y p e   r t   O N   ( r . R e l a t i o n s h i p T y p e R o w I d   =   r t . R e l a t i o n s h i p T y p e R o w I d )  
             W H E R E   ( s o u r c e _ m e . L e v e l   =   @ L e v e l   -   1 )  
                 A N D   E X I S T S   ( S E L E C T   *    
                                         F R O M   v R e l a t i o n s h i p M a n a g e m e n t G r o u p   r m g  
                                         W H E R E   ( r m g . R e l a t i o n s h i p R o w I d   =   r . R e l a t i o n s h i p R o w I d )  
                                             A N D   ( r m g . F r o m D a t e T i m e   <   I S N U L L ( @ E n d D a t e ,   ' 9 9 9 9 1 2 3 1 ' ) )  
                                             A N D   ( I S N U L L ( r m g . T o D a t e T i m e ,   ' 9 9 9 9 1 2 3 1 ' )   >   I S N U L L ( @ S t a r t D a t e ,   ' 1 9 0 0 0 1 0 1 ' ) )  
                                       )  
              
             S E T   @ R o w C o u n t   =   @ @ R O W C O U N T  
             S E T   @ L e v e l   =   @ L e v e l   +   1  
         E N D  
  
         - -   D e t e r m i n e   t h e   d e r i v e d   t y p e   h i e r a r c h y   o f   e a c h   S L O 
         S E L E C T   
                 0   a s   [ L e v e l ] ,   
                 s l o . S e r v i c e L e v e l O b j e c t i v e R o w I d ,   
                 s l o . T a r g e t M a n a g e d E n t i t y T y p e R o w I d   a s   M a n a g e d E n t i t y T y p e R o w I d 
         I N T O   # D e r i v e d T y p e H i e r a r c h y 
         F R O M   # S e r v i c e L e v e l O b j e c t i v e   s l o 
         
         S E T   @ L e v e l   =   1  
         S E T   @ R o w C o u n t   =   1 
         
         W H I L E   ( @ R o w C o u n t   >   0 )  
             B E G I N  
                 I N S E R T   # D e r i v e d T y p e H i e r a r c h y ( [ L e v e l ] ,   S e r v i c e L e v e l O b j e c t i v e R o w I d ,   M a n a g e d E n t i t y T y p e R o w I d )  
                 S E L E C T   D I S T I N C T   @ L e v e l ,   r t . S e r v i c e L e v e l O b j e c t i v e R o w I d ,   m e t m p v . M a n a g e d E n t i t y T y p e R o w I d  
                 F R O M   v M a n a g e d E n t i t y T y p e M a n a g e m e n t P a c k V e r s i o n   m e t m p v  
                             J O I N   # D e r i v e d T y p e H i e r a r c h y   r t   O N   ( m e t m p v . B a s e M a n a g e d E n t i t y T y p e R o w I d   =   r t . M a n a g e d E n t i t y T y p e R o w I d )  
                 W H E R E   ( r t . [ L e v e l ]   =   @ L e v e l   -   1 )  
                     - -   i f   t y p e   i s   d e r i v e d   f r o m   a   g i v e n   t y p e   o n   m u l t i p l e   l e v e l s   a c c o r d i n g   t o    
                     - -   d i f f e r e n t   v e r s i o n   o f   M P s   ( w h i c h   c a n   h a p p e n   o n   u p g r a d e )   t a k e   o n l y   t h e   l o w e s t   l e v e l  
                     A N D   ( N O T   E X I S T S   ( S E L E C T   *   F R O M   # D e r i v e d T y p e H i e r a r c h y   r   W H E R E   r . M a n a g e d E n t i t y T y p e R o w I d   =   m e t m p v . M a n a g e d E n t i t y T y p e R o w I d    
                         A N D   r . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   r t . S e r v i c e L e v e l O b j e c t i v e R o w I d ) )  
  
                 S E T   @ R o w C o u n t   =   @ @ R O W C O U N T  
                 S E T   @ L e v e l   =   @ L e v e l   +   1  
             E N D  
          
         - -   b u i l d   a   l i s t   o f   S l o   e n t i t i e s  
         C R E A T E   T A B L E   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y   (  
               S e r v i c e L e v e l O b j e c t i v e R o w I d                               i n t   N O T   N U L L  
             , M a n a g e m e n t G r o u p R o w I d                                           i n t   N O T   N U L L  
             , S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d     i n t   N O T   N U L L  
         )  
          
         I N S E R T   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y   (  
               S e r v i c e L e v e l O b j e c t i v e R o w I d  
             , M a n a g e m e n t G r o u p R o w I d  
             , S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d  
         )  
         S E L E C T   D I S T I N C T  
               s l o . S e r v i c e L e v e l O b j e c t i v e R o w I d  
             , s l o . M a n a g e m e n t G r o u p R o w I d  
             , m e . M a n a g e d E n t i t y R o w I d  
         F R O M   # S e r v i c e L e v e l O b j e c t i v e   s l o  
                     J O I N   # C o n t a i n e d M a n a g e d E n t i t y   m e   O N   ( s l o . M a n a g e m e n t G r o u p R o w I d   =   m e . M a n a g e m e n t G r o u p R o w I d )   A N D   ( s l o . S e r v i c e L e v e l A g r e e m e n t R o w I d   =   m e . S e r v i c e L e v e l A g r e e m e n t R o w I d )  
                     J O I N   # D e r i v e d T y p e H i e r a r c h y   t   O N   ( s l o . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   t . S e r v i c e L e v e l O b j e c t i v e R o w I d )  
         W H E R E   E X I S T S   ( S E L E C T   T O P   1   *  
                                     F R O M   v T y p e d M a n a g e d E n t i t y   t m e    
                                     W H E R E   ( t . M a n a g e d E n t i t y T y p e R o w I d   =   t m e . M a n a g e d E n t i t y T y p e R o w I d )  
                                         A N D   ( m e . M a n a g e d E n t i t y R o w I d   =   t m e . M a n a g e d E n t i t y R o w I d )  
                                         A N D   ( t m e . F r o m D a t e T i m e   <   I S N U L L ( @ E n d D a t e ,   ' 9 9 9 9 1 2 3 1 ' ) )  
                                         A N D   ( I S N U L L ( t m e . T o D a t e T i m e ,   ' 9 9 9 9 1 2 3 1 ' )   >   I S N U L L ( @ S t a r t D a t e ,   ' 1 9 0 0 0 1 0 1 ' ) )  
                                   )  
                                    
         C R E A T E   T A B L E   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l   (  
                   S e r v i c e L e v e l O b j e c t i v e R o w I d               i n t               N O T   N U L L  
                 , M a n a g e m e n t G r o u p R o w I d                           i n t               N O T   N U L L  
                 , S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d   i n t   N O T   N U L L  
                 , [ D a t e T i m e ]                                               d a t e t i m e     N O T   N U L L  
                 , A c t u a l V a l u e                                             f l o a t           N O T   N U L L  
                 , W e i g h t                                                       i n t               N O T   N U L L  
                 , T o t a l D o w n t i m e M i l l i s e c o n d s                 i n t               N U L L  
         )  
  
         - -   d e t a i l s   d a t a   g e t   S P   l o o k s   f o r   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y  
         - -   t a b l e   t o   p u l l   u p   M E s   i t   n e e d s   t o   w o r k   w i t h  
         I N S E R T   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l   (  
                   S e r v i c e L e v e l O b j e c t i v e R o w I d  
                 , M a n a g e m e n t G r o u p R o w I d  
                 , S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d  
                 , [ D a t e T i m e ]  
                 , A c t u a l V a l u e  
                 , W e i g h t  
                 , T o t a l D o w n t i m e M i l l i s e c o n d s  
         )  
         E X E C   [ s d k ] . [ S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l D a t a G e t ]  
                   @ S t a r t D a t e  
                 , @ E n d D a t e  
                 , @ A g g r e g a t i o n T y p e I d  
                  
          
                 C R E A T E   T A B L E   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y A g g r e g a t e d V a l u e s   (  
                    
                 S e r v i c e L e v e l A g r e e m e n t R o w I d 	 	 	 	 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l O b j e c t i v e R o w I d 	 	 	 	 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d 	 i n t               N O T   N U L L  
                 , A g g r e g a t e d V a l u e 	 	 	 	 	 	 	 f l o a t           N O T   N U L L  
                 , M a n a g e m e n t G r o u p R o w I d 	 	 	 	 	 	 i n t               N O T   N U L L            
         ) 	    
                  
         I N S E R T   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y A g g r e g a t e d V a l u e s   (    
                 S e r v i c e L e v e l A g r e e m e n t R o w I d  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                 , S e r v i c e L e v e l O b j e c t i v e R o w I d                
                 , S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d  
                 , A g g r e g a t e d V a l u e  
                 , M a n a g e m e n t G r o u p R o w I d  
             )  
         S E L E C T    
         t e m p A g g r V a l u e s . S e r v i c e L e v e l A g r e e m e n t R o w I d  
         ,   t e m p A g g r V a l u e s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
         ,   S e r v i c e L e v e l O b j e c t i v e R o w I d   =   t e m p A g g r V a l u e s . S e r v i c e L e v e l O b j e c t i v e R o w I d  
         ,   S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d   =   t e m p A g g r V a l u e s . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d  
         ,   A g g r e g a t e d V a l u e   =  
                 C A S E  
                     W H E N   s l o m p v . M o n i t o r S e r v i c e L e v e l O b j e c t i v e I n d   =   1   T H E N   t e m p A g g r V a l u e s . A v g V a l u e  
                     W H E N   s l o m p v . P e r f o r m a n c e S e r v i c e L e v e l O b j e c t i v e I n d   =   1   T H E N    
                                 C A S E   p s l o m p v . A g g r e g a t i o n M e t h o d  
                                         W H E N   ' a v g '   T H E N   t e m p A g g r V a l u e s . A v g V a l u e  
                                         W H E N   ' m i n '   T H E N   t e m p A g g r V a l u e s . M i n V a l u e  
                                         W H E N   ' m a x '   T H E N   t e m p A g g r V a l u e s . M a x V a l u e  
                                 E N D  
                 E N D  
         ,   M a n a g e m e n t G r o u p R o w I d   =   t e m p A g g r V a l u e s . M a n a g e m e n t G r o u p R o w I d  
         F R O M    
                 (   S E L E C T   S e r v i c e L e v e l A g r e e m e n t R o w I d   =   s l a m e . S e r v i c e L e v e l A g r e e m e n t R o w I d  
                                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d   =   s l a m e . M a n a g e d E n t i t y R o w I d  
                                 , S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m e . S e r v i c e L e v e l O b j e c t i v e R o w I d  
                                 , S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d  
                                 , A v g V a l u e   =   s u m ( s l o m e . A c t u a l V a l u e   *   s l o m e . W e i g h t ) / s u m ( s l o m e . W e i g h t )  
                                 , M i n V a l u e   =   m i n ( s l o m e . A c t u a l V a l u e )  
                                 , M a x V a l u e   =   m a x ( s l o m e . A c t u a l V a l u e )  
                                 , M a n a g e m e n t G r o u p R o w I d   =   s l o m e . M a n a g e m e n t G r o u p R o w I d  
                         F R O M   # S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y   s l a m e  
                                         J O I N   # S e r v i c e L e v e l O b j e c t i v e   s l o   O N   ( s l o . S e r v i c e L e v e l A g r e e m e n t R o w I d   =   s l a m e . S e r v i c e L e v e l A g r e e m e n t R o w I d )   A N D  
                                                                                                               ( s l o . M a n a g e m e n t G r o u p R o w I d   =   s l a m e . M a n a g e m e n t G r o u p R o w I d )  
                                         J O I N   # C o n t a i n e d M a n a g e d E n t i t y   c m e   O N   ( s l a m e . M a n a g e d E n t i t y R o w I d   =   c m e . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d )   A N D    
                                                                                                                 ( c m e . S e r v i c e L e v e l A g r e e m e n t R o w I d   =   s l a m e . S e r v i c e L e v e l A g r e e m e n t R o w I d )   A N D  
                                                                                                                 ( c m e . M a n a g e m e n t G r o u p R o w I d   =   s l a m e . M a n a g e m e n t G r o u p R o w I d )  
                                         J O I N   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l   s l o m e   O N   ( s l o . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m e . S e r v i c e L e v e l O b j e c t i v e R o w I d )   A N D    
                                                                                                                                                         ( s l a m e . M a n a g e m e n t G r o u p R o w I d   =   s l o . M a n a g e m e n t G r o u p R o w I d )   A N D  
                                                                                                                                                         ( c m e . M a n a g e d E n t i t y R o w I d   =   s l o m e . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d )  
                         G R O U P   B Y   s l o m e . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d ,   s l o m e . S e r v i c e L e v e l O b j e c t i v e R o w I d ,   s l a m e . M a n a g e d E n t i t y R o w I d ,   s l a m e . S e r v i c e L e v e l A g r e e m e n t R o w I d ,   s l o m e . M a n a g e m e n t G r o u p R o w I d 	    
                 )   a s   t e m p A g g r V a l u e s    
                 J O I N   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v   O N   t e m p A g g r V a l u e s . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m p v . S e r v i c e L e v e l O b j e c t i v e R o w I d  
                 L E F T   J O I N   v P e r f o r m a n c e S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   p s l o m p v   O N   ( p s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   =   s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d )  
                 W H E R E   N O T   E X I S T S   ( S E L E C T   *  
                                             F R O M   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v _ n e w e r  
                                                         J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v   O N   ( s l o m p v _ n e w e r . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d )  
                                             W H E R E   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   t e m p A g g r V a l u e s . S e r v i c e L e v e l O b j e c t i v e R o w I d )  
                                                 A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   t e m p A g g r V a l u e s . M a n a g e m e n t G r o u p R o w I d )  
                                                 A N D   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   >   s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d )  
                                           )   - -   t h i s   i s   t h e   l a t e s t   S L O   d e f i n i t i o n   f o r   t h i s   M G  
                                  
                                                                                          
         - -   C a l c u l a t e   t h e   S t a t e   o f   E a c h   S e r v i c e   L e v e l   O b j e c t i v e   c o r r e s p o n d i n g   t o   a   S e r v i c e   L e v e l   M a n a g e d   E n t i t y   	 	 	 	 	 	 	 	 	  
         C R E A T E   T A B L E   # S e r v i c e L e v e l O b j e c t i v e S t a t e   (  
                   S e r v i c e L e v e l A g r e e m e n t R o w I d 	 	 	 	 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l O b j e c t i v e R o w I d 	 	 	 	 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l O b j e c t i v e S t a t e 	 	 	 	 	 i n t               N O T   N U L L  
                 , G o a l 	 	 	 	 	 	 	 	 	 	 i n t               N O T   N U L L  
                 , S l o M a n a g e d E n t i t y C o u n t 	 	 	 	 	 	 i n t               N O T   N U L L  
                 , M a n a g e m e n t G r o u p R o w I d 	 	 	 	 	 	 i n t               N O T   N U L L                  
         ) 	                  
  
             I N S E R T   # S e r v i c e L e v e l O b j e c t i v e S t a t e   (    
                 S e r v i c e L e v e l A g r e e m e n t R o w I d  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d                
                 , S e r v i c e L e v e l O b j e c t i v e R o w I d  
                 , S e r v i c e L e v e l O b j e c t i v e S t a t e  
                 , G o a l  
                 , S l o M a n a g e d E n t i t y C o u n t  
                 , M a n a g e m e n t G r o u p R o w I d  
             )  
             S E L E C T  
                   t e m p S l o V a l u e s . S e r v i c e L e v e l A g r e e m e n t R o w I d  
                 , t e m p S l o V a l u e s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                 , t e m p S l o V a l u e s . S e r v i c e L e v e l O b j e c t i v e R o w I d  
                 , C A S E  
                     W H E N   s l o m p v . M o n i t o r S e r v i c e L e v e l O b j e c t i v e I n d   =   1    
                         T H E N    
                                 C A S E  
                                   W H E N   t e m p S l o V a l u e s . M i n V a l u e   > =   s l o . G o a l    
                                         T H E N   1    
                                         E L S E   0    
                                 E N D  
                     W H E N   s l o m p v . P e r f o r m a n c e S e r v i c e L e v e l O b j e c t i v e I n d   =   1    
                         T H E N    
                                 C A S E  
                                 W H E N   s l o . D e s i r e d O b j e c t i v e   =   ' u n d e r '    
                                         T H E N    
                                                 C A S E  
                                                   W H E N   t e m p S l o V a l u e s . M a x V a l u e   <   s l o . G o a l    
                                                         T H E N   1    
                                                         E L S E   0    
                                                 E N D  
                                 W H E N   s l o . D e s i r e d O b j e c t i v e   =   ' o v e r '    
                                         T H E N    
                                                 C A S E  
                                                   W H E N   t e m p S l o V a l u e s . M i n V a l u e   > =   s l o . G o a l    
                                                         T H E N   1    
                                                         E L S E   0    
                                                 E N D 	  
                                 E N D  
                   E N D 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	  
                 , G o a l  
                 , t e m p S l o V a l u e s . S l o M a n a g e d E n t i t y C o u n t  
                 , t e m p S l o V a l u e s . M a n a g e m e n t G r o u p R o w I d  
             F R O M      
                                 ( 	  
                                         S E L E C T   S e r v i c e L e v e l A g r e e m e n t R o w I d   =   s l o m e a v 1 . S e r v i c e L e v e l A g r e e m e n t R o w I d  
                                                     , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d   =   s l o m e a v 1 . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                                                     , s l o m e a v 1 . S e r v i c e L e v e l O b j e c t i v e R o w I d  
                                                     , M a x V a l u e   =   m a x ( s l o m e a v 1 . A g g r e g a t e d V a l u e )  
                                                     , M i n V a l u e   =   m i n ( s l o m e a v 1 . A g g r e g a t e d V a l u e )  
                                                     , S l o M a n a g e d E n t i t y C o u n t   =   C O U N T ( D I S T I N C T   ( s l o m e a v 1 . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d ) )  
                                                     , M a n a g e m e n t G r o u p R o w I d   =   s l o m e a v 1 . M a n a g e m e n t G r o u p R o w I d  
                                         F R O M   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y A g g r e g a t e d V a l u e s   s l o m e a v 1  
                                         G R O U P   B Y   s l o m e a v 1 . S e r v i c e L e v e l O b j e c t i v e R o w I d ,   s l o m e a v 1 . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d ,   s l o m e a v 1 . S e r v i c e L e v e l A g r e e m e n t R o w I d ,   s l o m e a v 1 . M a n a g e m e n t G r o u p R o w I d  
                                 )   A S   t e m p S l o V a l u e s    
                                 J O I N   # S e r v i c e L e v e l O b j e c t i v e   s l o   O N   ( t e m p S l o V a l u e s . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o . S e r v i c e L e v e l O b j e c t i v e R o w I d )   A N D   ( s l o . M a n a g e m e n t G r o u p R o w I d   =   t e m p S l o V a l u e s . M a n a g e m e n t G r o u p R o w I d )  
                                 J O I N   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v   O N   ( s l o m p v . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o . S e r v i c e L e v e l O b j e c t i v e R o w I d )  
                                 L E F T   J O I N   v P e r f o r m a n c e S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   p s l o m p v   O N   ( p s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   =   s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d ) 	  
             W H E R E   N O T   E X I S T S   ( S E L E C T   *  
                                             F R O M   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v _ n e w e r  
                                                         J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v   O N   ( s l o m p v _ n e w e r . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d )  
                                             W H E R E   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   t e m p S l o V a l u e s . S e r v i c e L e v e l O b j e c t i v e R o w I d )  
                                                 A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   t e m p S l o V a l u e s . M a n a g e m e n t G r o u p R o w I d )  
                                                 A N D   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   >   s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d )  
                                           )   - -   t h i s   i s   t h e   l a t e s t   S L O   d e f i n i t i o n   f o r   t h i s   M G  
  
            
         - -   C a l c u l a t e   t h e   S t a t e   o f   E a c h   S e r v i c e   L e v e l   M a n a g e d   E n t i t y    
         C R E A T E   T A B L E   # S e r v i c e L e v e l M a n a g e d E n t i t y S t a t e   (  
                   S e r v i c e L e v e l A g r e e m e n t R o w I d 	 	 	 	 	 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d 	 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y S t a t e 	 	 i n t               N O T   N U L L  
                 , M a n a g e m e n t G r o u p R o w I d 	 	 	 	 	 	 	 i n t               N O T   N U L L                  
         )  
                  
         I N S E R T   # S e r v i c e L e v e l M a n a g e d E n t i t y S t a t e   (    
                 S e r v i c e L e v e l A g r e e m e n t R o w I d          
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                 , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y S t a t e  
                 , M a n a g e m e n t G r o u p R o w I d  
             )  
             S E L E C T  
                   s l o s . S e r v i c e L e v e l A g r e e m e n t R o w I d  
                   , s l o s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
                 , m i n ( s l o s . S e r v i c e L e v e l O b j e c t i v e S t a t e )  
                 , s l o s . M a n a g e m e n t G r o u p R o w I d  
             F R O M   # S e r v i c e L e v e l O b j e c t i v e S t a t e   s l o s  
             G R O U P   B Y     s l o s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d ,   s l o s . S e r v i c e L e v e l A g r e e m e n t R o w I d ,   s l o s . M a n a g e m e n t G r o u p R o w I d  
              
             - - C a l c u l a t e   t h e   s t a t e   o f   e a c h   s e r v c i e   L e v e l   d e p e n d i n g   o n   t h e   s t a t e s   o f   a l l   S e r v i c e   L e v e l   M a n a g e d   E n t i t i e s  
             C R E A T E   T A B L E   # S e r v i c e L e v e l S t a t e   (  
                   S e r v i c e L e v e l A g r e e m e n t R o w I d 	 	 	 	 	 i n t               N O T   N U L L  
                 , S e r v i c e L e v e l S t a t e 	 	 	 	 	 	 	 i n t               N O T   N U L L  
                 , M a n a g e m e n t G r o u p R o w I d 	 	 	 	 	 	 i n t               N O T   N U L L                  
         )  
                  
         I N S E R T   # S e r v i c e L e v e l S t a t e   (    
                 S e r v i c e L e v e l A g r e e m e n t R o w I d          
                 , S e r v i c e L e v e l S t a t e  
                 , M a n a g e m e n t G r o u p R o w I d  
             )  
             S E L E C T  
                   s l m e s . S e r v i c e L e v e l A g r e e m e n t R o w I d  
                 , m i n ( s l m e s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y S t a t e )  
                 , s l m e s . M a n a g e m e n t G r o u p R o w I d  
             F R O M   # S e r v i c e L e v e l M a n a g e d E n t i t y S t a t e   s l m e s  
             G R O U P   B Y   s l m e s . S e r v i c e L e v e l A g r e e m e n t R o w I d ,   s l m e s . M a n a g e m e n t G r o u p R o w I d  
              
            
              
             S E L E C T   D I S T I N C T  
               s l s . S e r v i c e L e v e l A g r e e m e n t R o w I d  
             , s l s . S e r v i c e L e v e l S t a t e  
             , s l o m e a v . M a n a g e m e n t G r o u p R o w I d  
             , S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d   =   s l m e s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d  
             , s l m e s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y S t a t e  
             , s l o m e a v . S e r v i c e L e v e l O b j e c t i v e R o w I d  
             , s l o s . S e r v i c e L e v e l O b j e c t i v e S t a t e  
             , s l o s . S l o M a n a g e d E n t i t y C o u n t  
             F R O M   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y A g g r e g a t e d V a l u e s   s l o m e a v  
                         J O I N   # S e r v i c e L e v e l O b j e c t i v e S t a t e   s l o s   O N   ( s l o s . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m e a v . S e r v i c e L e v e l O b j e c t i v e R o w I d )   A N D   ( s l o s . M a n a g e m e n t G r o u p R o w I d   =   s l o m e a v . M a n a g e m e n t G r o u p R o w I d )   A N D   ( s l o m e a v . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d   =   s l o s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d )   A N D   ( s l o m e a v . S e r v i c e L e v e l A g r e e m e n t R o w I d   =   s l o s . S e r v i c e L e v e l A g r e e m e n t R o w I d )  
                         J O I N   # S e r v i c e L e v e l M a n a g e d E n t i t y S t a t e   s l m e s   O N   ( s l m e s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d   =   s l o s . S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y R o w I d ) A N D   ( s l o s . M a n a g e m e n t G r o u p R o w I d   =   s l m e s . M a n a g e m e n t G r o u p R o w I d )   A N D   ( s l m e s . S e r v i c e L e v e l A g r e e m e n t R o w I d   =   s l o s . S e r v i c e L e v e l A g r e e m e n t R o w I d )  
                         J O I N   # S e r v i c e L e v e l S t a t e   s l s   O N   ( s l s . S e r v i c e L e v e l A g r e e m e n t R o w I d   =   s l m e s . S e r v i c e L e v e l A g r e e m e n t R o w I d )   A N D   ( s l s . M a n a g e m e n t G r o u p R o w I d   =   s l m e s . M a n a g e m e n t G r o u p R o w I d )    
                        
                          
     E N D   T R Y  
     B E G I N   C A T C H  
         S E L E C T    
               @ E r r o r N u m b e r   =   E R R O R _ N U M B E R ( )  
             , @ E r r o r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
             , @ E r r o r S t a t e   =   E R R O R _ S T A T E ( )  
             , @ E r r o r L i n e   =   E R R O R _ L I N E ( )  
             , @ E r r o r P r o c e d u r e   =   I S N U L L ( E R R O R _ P R O C E D U R E ( ) ,   ' - ' )  
             , @ E r r o r M e s s a g e T e x t   =   E R R O R _ M E S S A G E ( )  
  
         S E T   @ E r r o r I n d   =   1  
     E N D   C A T C H  
  
 C l e a n u p :  
  
     - -   c l e a n u p  
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l A g r e e m e n t M a n a g e d E n t i t y  
  
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l O b j e c t i v e ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l O b j e c t i v e  
  
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # C o n t a i n m e n t R e l a t i o n s h i p T y p e ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # C o n t a i n m e n t R e l a t i o n s h i p T y p e  
  
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # C o n t a i n e d M a n a g e d E n t i t y ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # C o n t a i n e d M a n a g e d E n t i t y  
  
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # D e r i v e d T y p e H i e r a r c h y ' )   I S   N O T   N U L L ) 
         D R O P   T A B L E   # D e r i v e d T y p e H i e r a r c h y  
  
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y  
          
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l  
              
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y A g g r e g a t e d V a l u e s ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y A g g r e g a t e d V a l u e s  
          
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l O b j e c t i v e S t a t e ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l O b j e c t i v e S t a t e  
          
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l M a n a g e d E n t i t y S t a t e ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l M a n a g e d E n t i t y S t a t e  
          
     I F   ( O B J E C T _ I D ( ' t e m p d b . . # S e r v i c e L e v e l S t a t e ' )   I S   N O T   N U L L )  
         D R O P   T A B L E   # S e r v i c e L e v e l S t a t e  
  
     - -   r e p o r t   e r r o r   i f   a n y  
     I F   ( @ E r r o r I n d   =   1 )  
     B E G I N  
         D E C L A R E   @ A d j u s t e d E r r o r S e v e r i t y   i n t  
  
         S E T   @ A d j u s t e d E r r o r S e v e r i t y   =   C A S E  
                                                                       W H E N   @ E r r o r S e v e r i t y   >   1 8   T H E N   1 8  
                                                                       E L S E   @ E r r o r S e v e r i t y  
                                                                   E N D  
          
         R A I S E R R O R   ( 7 7 7 9 7 1 0 0 2 ,   @ A d j u s t e d E r r o r S e v e r i t y ,   1  
             , @ E r r o r N u m b e r  
             , @ E r r o r S e v e r i t y  
             , @ E r r o r S t a t e  
             , @ E r r o r P r o c e d u r e  
             , @ E r r o r L i n e  
             , @ E r r o r M e s s a g e T e x t  
         )  
     E N D  
 E N D  
 G O  
  
 G R A N T   E X E C U T E   O N   s d k . [ G e t S e r v i c e L e v e l I n f o r m a t i o n D a t a ]   T O   O p s M g r R e a d e r  
 G O  
 I F   ( O B J E C T P R O P E R T Y ( O B J E C T _ I D ( ' s d k . [ S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l D a t a G e t ] ' ) ,   ' I s P r o c e d u r e ' )   I S   N U L L )  
 B E G I N  
 	 	 E X E C U T E   ( ' C R E A T E   P R O C E D U R E   s d k . [ S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l D a t a G e t ]   A S   R E T U R N   1 ' )  
 	 E N D  
 G O  
  
 A L T E R   P R O C E D U R E   [ s d k ] . [ S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y D e t a i l D a t a G e t ]  
 	   @ S t a r t D a t e                                           d a t e t i m e  
 	 , @ E n d D a t e                                               d a t e t i m e  
 	 , @ A g g r e g a t i o n T y p e I d                           i n t  
 A S  
 B E G I N  
     S E T   N O C O U N T   O N  
      
     D E C L A R E    
           @ E r r o r I n d                 b i t  
         , @ E r r o r M e s s a g e         n v a r c h a r ( m a x )  
         , @ E r r o r N u m b e r           i n t  
         , @ E r r o r S e v e r i t y       i n t  
         , @ E r r o r S t a t e             i n t  
         , @ E r r o r L i n e               i n t  
         , @ E r r o r P r o c e d u r e     n v a r c h a r ( 2 5 6 )  
         , @ E r r o r M e s s a g e T e x t   n v a r c h a r ( m a x )  
  
     S E T   @ E r r o r I n d   =   0  
      
     D E C L A R E    
           @ S t a t e m e n t   n v a r c h a r ( m a x )  
            
     - -   a d j u s t   d a t e   &   t i m e   i n l i n e   w i t h   a v a i l a b i l i t y   r e p o r t  
     - -   e x c l u d e   m i n u t e s ,   s e c o n d s ,   m i l l i s e c o n d s  
     - -   a n d   a d d   1   h o u r   i n   c a s e   o f   d a i l y   a g g r e g a t i o n s  
     S E L E C T    
           @ S t a r t D a t e   =   D A T E A D D ( h h ,   D A T E P A R T ( h h ,   @ S t a r t D a t e )   +   C A S E   @ A g g r e g a t i o n T y p e I d   W H E N   2 0   T H E N   0   E L S E   1   E N D ,   c o n v e r t ( v a r c h a r ( 8 ) ,   @ S t a r t D a t e ,   1 1 2 ) )  
         , @ E n d D a t e   =   D A T E A D D ( h h ,   D A T E P A R T ( h h ,   @ E n d D a t e )   +   C A S E   @ A g g r e g a t i o n T y p e I d   W H E N   2 0   T H E N   0   E L S E   1   E N D ,   c o n v e r t ( v a r c h a r ( 8 ) ,   @ E n d D a t e ,   1 1 2 ) )  
            
     B E G I N   T R Y  
  
         S E T   @ S t a t e m e n t   =        
             '   S E L E C T '  
             +   '       s l o m e . S e r v i c e L e v e l O b j e c t i v e R o w I d '  
             +   '     , s l o m e . M a n a g e m e n t G r o u p R o w I d '  
             +   '     , s l o m e . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d '  
             +   '     , s . D a t e T i m e '  
             +   '     , A c t u a l V a l u e   =   1 0 0 . 0   *   ( '  
             +   '                                         s . I n t e r v a l D u r a t i o n M i l l i s e c o n d s   '  
             +   '                                     -   s . I n R e d S t a t e M i l l i s e c o n d s '  
             +   '                                     -   s . I n Y e l l o w S t a t e M i l l i s e c o n d s   *   m s l o m p v . Y e l l o w S t a t e U n d e s i r e d I n d '  
             +   '                                     -   s . I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   *   m s l o m p v . P l a n n e d M a i n t e n a n c e S t a t e U n d e s i r e d I n d '  
             +   '                                     -   s . I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   *   m s l o m p v . U n p l a n n e d M a i n t e n a n c e S t a t e U n d e s i r e d I n d '  
             +   '                                     -   s . I n D i s a b l e d S t a t e M i l l i s e c o n d s   *   m s l o m p v . D i s a b l e d S t a t e U n d e s i r e d I n d '  
             +   '                                     -   s . H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   *   m s l o m p v . H e a l t h S e r v i c e U n a v a i l a b l e S t a t e U n d e s i r e d I n d '  
             +   '                                     -   s . I n W h i t e S t a t e M i l l i s e c o n d s   *   m s l o m p v . U n m o n i t o r e d S t a t e U n d e r s i r e d I n d '  
             +   '                                   )   /   s . I n t e r v a l D u r a t i o n M i l l i s e c o n d s '  
             +   '     , W e i g h t   =   1 '  
             +   '     , T o t a l D o w n t i m e M i l l i s e c o n d s   =   '  
             +   '                           s . I n R e d S t a t e M i l l i s e c o n d s '  
             +   '                                     +   s . I n Y e l l o w S t a t e M i l l i s e c o n d s   *   m s l o m p v . Y e l l o w S t a t e U n d e s i r e d I n d '  
             +   '                                     +   s . I n P l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   *   m s l o m p v . P l a n n e d M a i n t e n a n c e S t a t e U n d e s i r e d I n d '  
             +   '                                     +   s . I n U n p l a n n e d M a i n t e n a n c e M i l l i s e c o n d s   *   m s l o m p v . U n p l a n n e d M a i n t e n a n c e S t a t e U n d e s i r e d I n d '  
             +   '                                     +   s . I n D i s a b l e d S t a t e M i l l i s e c o n d s   *   m s l o m p v . D i s a b l e d S t a t e U n d e s i r e d I n d '  
             +   '                                     +   s . H e a l t h S e r v i c e U n a v a i l a b l e M i l l i s e c o n d s   *   m s l o m p v . H e a l t h S e r v i c e U n a v a i l a b l e S t a t e U n d e s i r e d I n d '  
             +   '                                     +   s . I n W h i t e S t a t e M i l l i s e c o n d s   *   m s l o m p v . U n m o n i t o r e d S t a t e U n d e r s i r e d I n d '  
             +   '   F R O M   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y   s l o m e '  
             +   '             J O I N   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v   O N   ( s l o m p v . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m e . S e r v i c e L e v e l O b j e c t i v e R o w I d ) '  
             +   '             J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v   O N   ( s l o m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d )   A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   s l o m e . M a n a g e m e n t G r o u p R o w I d ) '    
             +   '             J O I N   v M o n i t o r S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   m s l o m p v   O N   ( s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d ) '  
             +   '             J O I N   v M a n a g e d E n t i t y M o n i t o r   m e m   O N   ( s l o m e . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d   =   m e m . M a n a g e d E n t i t y R o w I d )   A N D   ( m e m . M o n i t o r R o w I d   =   m s l o m p v . M o n i t o r R o w I d ) '  
             +   '             J O I N   % S t a t e D a t a T a b l e %   s   O N   ( m e m . M a n a g e d E n t i t y M o n i t o r R o w I d   =   s . M a n a g e d E n t i t y M o n i t o r R o w I d ) '  
             +   '   W H E R E ( s . [ D a t e T i m e ]   > =   @ S t a r t D a t e ) '  
             +   '     A N D   ( s . [ D a t e T i m e ]   <   @ E n d D a t e ) '  
             +   '     A N D   ( s . [ D a t e ]   B E T W E E N   D A T E A D D ( d a y ,   - 1 ,   @ S t a r t D a t e )   A N D   D A T E A D D ( d a y ,   1 ,   @ E n d D a t e ) ) '  
             +   '     A N D   N O T   E X I S T S   ( S E L E C T   * '  
             +   '                                     F R O M   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v _ n e w e r '  
             +   '                                                 J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v   O N   ( s l o m p v _ n e w e r . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d ) '  
             +   '                                     W H E R E   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m p v . S e r v i c e L e v e l O b j e c t i v e R o w I d ) '  
             +   '                                         A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   s l o m e . M a n a g e m e n t G r o u p R o w I d ) '  
             +   '                                         A N D   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   >   s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d ) '  
             +   '                                   ) '  
  
             +   '   U N I O N   A L L '  
  
             +   '   S E L E C T '  
             +   '       s l o m e . S e r v i c e L e v e l O b j e c t i v e R o w I d '  
             +   '     , s l o m e . M a n a g e m e n t G r o u p R o w I d '  
             +   '     , s l o m e . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d '  
             +   '     , p . D a t e T i m e '  
             +   '     , C A S E   p s l o m p v . A g g r e g a t i o n M e t h o d '  
             +   '           W H E N   ' ' m i n ' '   T H E N   p . M i n V a l u e '  
             +   '           W H E N   ' ' a v g ' '   T H E N   p . A v e r a g e V a l u e '  
             +   '           W H E N   ' ' m a x ' '   T H E N   p . M a x V a l u e '  
             +   '       E N D   '  
             +   '     , p . S a m p l e C o u n t '  
             +   '     , N U L L '  
             +   '   F R O M   # S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y   s l o m e '  
             +   '             J O I N   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v   O N   ( s l o m p v . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m e . S e r v i c e L e v e l O b j e c t i v e R o w I d ) '  
             +   '             J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v   O N   ( s l o m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d )   A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   s l o m e . M a n a g e m e n t G r o u p R o w I d ) '    
             +   '             J O I N   v P e r f o r m a n c e S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   p s l o m p v   O N   ( s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   =   p s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d ) '  
             +   '             J O I N   v P e r f o r m a n c e R u l e I n s t a n c e   p r i   O N   ( p s l o m p v . R u l e R o w I d   =   p r i . R u l e R o w I d ) '  
             +   '             J O I N   % P e r f D a t a T a b l e %   p   O N   ( p r i . P e r f o r m a n c e R u l e I n s t a n c e R o w I d   =   p . P e r f o r m a n c e R u l e I n s t a n c e R o w I d )   A N D   ( s l o m e . S e r v i c e L e v e l O b j e c t i v e M a n a g e d E n t i t y R o w I d   =   p . M a n a g e d E n t i t y R o w I d ) '  
             +   '   W H E R E ( p . [ D a t e T i m e ]   > =   @ S t a r t D a t e ) '  
             +   '     A N D   ( p . [ D a t e T i m e ]   <   @ E n d D a t e ) '  
             +   '     A N D   N O T   E X I S T S   ( S E L E C T   * '  
             +   '                                     F R O M   v S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n   s l o m p v _ n e w e r '  
             +   '                                                 J O I N   v M a n a g e m e n t G r o u p M a n a g e m e n t P a c k V e r s i o n   m g m p v   O N   ( s l o m p v _ n e w e r . M a n a g e m e n t P a c k V e r s i o n R o w I d   =   m g m p v . M a n a g e m e n t P a c k V e r s i o n R o w I d ) '  
             +   '                                     W H E R E   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e R o w I d   =   s l o m p v . S e r v i c e L e v e l O b j e c t i v e R o w I d ) '  
             +   '                                         A N D   ( m g m p v . M a n a g e m e n t G r o u p R o w I d   =   s l o m e . M a n a g e m e n t G r o u p R o w I d ) '  
             +   '                                         A N D   ( s l o m p v _ n e w e r . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d   >   s l o m p v . S e r v i c e L e v e l O b j e c t i v e M a n a g e m e n t P a c k V e r s i o n R o w I d ) '  
             +   '                                   ) '  
  
         I F   ( @ A g g r e g a t i o n T y p e I d   =   2 0 )  
         B E G I N  
             S E T   @ S t a t e m e n t   =   R E P L A C E ( @ S t a t e m e n t ,   ' % S t a t e D a t a T a b l e % ' ,   ' G e t S t a t e H o u r l y ( @ S t a r t D a t e ,   @ E n d D a t e ) ' )  
             S E T   @ S t a t e m e n t   =   R E P L A C E ( @ S t a t e m e n t ,   ' % P e r f D a t a T a b l e % ' ,   ' [ P e r f ] . [ v P e r f H o u r l y ] ' )  
         E N D  
         E L S E   I F   ( @ A g g r e g a t i o n T y p e I d   =   3 0 )  
         B E G I N  
             S E T   @ S t a t e m e n t   =   R E P L A C E ( @ S t a t e m e n t ,   ' % S t a t e D a t a T a b l e % ' ,   ' G e t S t a t e D a i l y ( @ S t a r t D a t e ,   @ E n d D a t e ) ' )  
             S E T   @ S t a t e m e n t   =   R E P L A C E ( @ S t a t e m e n t ,   ' % P e r f D a t a T a b l e % ' ,   ' [ P e r f ] . [ v P e r f D a i l y ] ' )  
         E N D  
  
         E X E C   s p _ e x e c u t e s q l   @ S t a t e m e n t ,   N ' @ S t a r t D a t e   d a t e t i m e ,   @ E n d D a t e   d a t e t i m e ' ,   @ S t a r t D a t e   =   @ S t a r t D a t e ,   @ E n d D a t e   =   @ E n d D a t e  
     E N D   T R Y  
     B E G I N   C A T C H  
         S E L E C T    
               @ E r r o r N u m b e r   =   E R R O R _ N U M B E R ( )  
             , @ E r r o r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
             , @ E r r o r S t a t e   =   E R R O R _ S T A T E ( )  
             , @ E r r o r L i n e   =   E R R O R _ L I N E ( )  
             , @ E r r o r P r o c e d u r e   =   I S N U L L ( E R R O R _ P R O C E D U R E ( ) ,   ' - ' )  
             , @ E r r o r M e s s a g e T e x t   =   E R R O R _ M E S S A G E ( )  
  
         S E T   @ E r r o r I n d   =   1  
     E N D   C A T C H  
  
 C l e a n u p :  
  
     - -   r e p o r t   e r r o r   i f   a n y  
     I F   ( @ E r r o r I n d   =   1 )  
     B E G I N  
         D E C L A R E   @ A d j u s t e d E r r o r S e v e r i t y   i n t  
  
         S E T   @ A d j u s t e d E r r o r S e v e r i t y   =   C A S E  
                                                                       W H E N   @ E r r o r S e v e r i t y   >   1 8   T H E N   1 8  
                                                                       E L S E   @ E r r o r S e v e r i t y  
                                                                   E N D  
          
         R A I S E R R O R   ( 7 7 7 9 7 1 0 0 2 ,   @ A d j u s t e d E r r o r S e v e r i t y ,   1  
             , @ E r r o r N u m b e r  
             , @ E r r o r S e v e r i t y  
             , @ E r r o r S t a t e  
             , @ E r r o r P r o c e d u r e  
             , @ E r r o r L i n e  
             , @ E r r o r M e s s a g e T e x t  
         )  
     E N D  
 E N D  
  
 G O  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C r e a t e   S Q L   p a t c h   v e r s i o n   t a b l e   w h i c h   m a i n t a i n s   l i s t   o f   i n s t a l l e d   S Q L   s c r i p t s   o n   t h e     - -  
 - -   S e r v e r .                                                                                                                                                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ S Q L P a t c h V e r s i o n ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 B E G I N  
 	 C R E A T E   T A B L E   [ d b o ] . [ S q l P a t c h V e r s i o n ] (  
 	 	 [ V a l u e ]   [ n v a r c h a r ]   ( 1 0 0 )   N O T   N U L L ,  
 	 	 [ S t a t e ]   [ n v a r c h a r ]   ( 1 0 0 )   N O T   N U L L ,  
 	 	 C O N S T R A I N T   P K _ S Q L P a t c h V e r s i o n   P R I M A R Y   K E Y ( V a l u e )  
 	 )  
  
 E N D  
 G O  
    
 G O    
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -    
 - -   I n s e r t i n g   c u r r e n t   S C O M   b u i l d   v e r s i o n   i n   S C O M   d a t a b a s e                                    
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -    
 I F   N O T   E X I S T S   ( S E L E C T   T O P   1   V a l u e   f r o m   [ d b o ] . [ S q l P a t c h V e r s i o n ]   w h e r e   V a l u e = ' 7 . 2 . 1 1 7 1 9 . 0 ' )    
       B E G I N    
               I N S E R T   I N T O   [ d b o ] . [ S q l P a t c h V e r s i o n ]    
               V A L U E S    
               ( ' 7 . 2 . 1 1 7 1 9 . 0 ' , ' C O M P L E T E D ' )    
       E N D    
 G O    
    
 
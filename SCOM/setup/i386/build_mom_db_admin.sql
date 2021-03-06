- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             R e c o v e r y M o d e . s q l                                                                                                 - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   S e t s   t h e   d a t a b a s e   r e c o v e r y   m o d e   t o   s i m p l e                                                 - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 D E C L A R E   @ C o m m a n d   n v a r c h a r ( 4 0 0 )  
 D E C L A R E   @ D b N a m e   n v a r c h a r ( 1 2 8 )  
  
 - -   P e r f o r m   o n l y   i n   c a s e   o f   a   c l e a n   i n s t a l l .  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   d b o . s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ _ _ M O M M a n a g e m e n t G r o u p I n f o _ _ ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 B E G I N  
         S E T   @ D b N a m e   =   D B _ N A M E ( )  
         S E T   @ C o m m a n d   =   ' A L T E R   D A T A B A S E   [ '   +   @ D b N a m e   +   ' ]   S E T   R E C O V E R Y   S I M P L E '  
  
         E X E C   s p _ e x e c u t e s q l   @ C o m m a n d  
 E N D  
  
 G O  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             S Q L O p t i o n s . s q l                                                                                                     - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   S e t s   A N S I   c o m p l i a n c e   o p t i o n s ,   a n d   a n y   o t h e r   S Q L   s e t u p   o p t i o n s         - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 D E C L A R E   @ C o m m a n d   n v a r c h a r ( 4 0 0 )  
 D E C L A R E   @ D b N a m e   n v a r c h a r ( 1 2 8 )  
  
 - -   P e r f o r m   o n l y   i n   c a s e   o f   a   c l e a n   i n s t a l l .  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   d b o . s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ _ _ M O M M a n a g e m e n t G r o u p I n f o _ _ ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 B E G I N  
         S E T   @ D b N a m e   =   D B _ N A M E ( )  
  
         S E T   @ C o m m a n d   =   ' A L T E R   D A T A B A S E   [ '   +   @ D b N a m e   +   ' ]   S E T   '   +  
                                       ' A N S I _ N U L L S   O N ,   '   +  
                                       ' A N S I _ P A D D I N G   O N ,   '   +  
                                       ' A N S I _ W A R N I N G S   O N ,   '   +  
                                       ' A R I T H A B O R T   O N ,   '   +  
                                       ' C O N C A T _ N U L L _ Y I E L D S _ N U L L 	 O N ,   '   +  
                                       ' Q U O T E D _ I D E N T I F I E R   O N ,   '   +  
                                       ' N U M E R I C _ R O U N D A B O R T   O F F   '  
  
         E X E C   s p _ e x e c u t e s q l   @ C o m m a n d  
 E N D  
  
 - -   E n a b l e   r o w - v e r s i o n i n g   ( s n a p s h o t )   b a s e d   r e a d - c o m m i t t e d   t r a n s a c t i o n   i s o l a t i o n   l e v e l .  
 S E T   @ D b N a m e   =   D B _ N A M E ( ) ;  
 S E T   @ C o m m a n d   =   ' A L T E R   D A T A B A S E   [ '   +   @ D b N a m e   +   ' ]   S E T   '   +  
                               ' R E A D _ C O M M I T T E D _ S N A P S H O T   O N   '   +  
                               ' W I T H   R O L L B A C K   I M M E D I A T E ; ' ;  
 E X E C   s p _ e x e c u t e s q l   @ C o m m a n d ;  
 G O  
  
 - -   A l l o w   m a n a g e d   c o d e .  
 - -   N O T E :   l i g h t w e i g h t   p o o l i n g   m u s t   n o t   b e   s e t   1  
  
 s p _ c o n f i g u r e   @ c o n f i g n a m e = c l r _ e n a b l e d ,   @ c o n f i g v a l u e = 1  
 G O  
 s p _ c o n f i g u r e   ' s h o w   a d v a n c e d   o p t i o n s ' ,   1  
 R E C O N F I G U R E  
 G O  
 s p _ c o n f i g u r e   @ c o n f i g n a m e = ' t r a n s f o r m   n o i s e   w o r d s ' ,   @ c o n f i g v a l u e = 1  
 G O  
 R E C O N F I G U R E  
 G O  
 s p _ c o n f i g u r e   ' s h o w   a d v a n c e d   o p t i o n s ' ,   0  
 R E C O N F I G U R E  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -         ( c )   C o p y r i g h t   2 0 0 8 ,   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   	 	 	 	     - -  
 - -         P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                     	 	 	 	 	     - -  
 - -                                                                                                                                                       	 	 	 	 	 	 	 	     - -  
 - -         F i l e :   F u l l T e x t . s q l                                                                                         	 	 	 	 	 	 	     - -  
 - -                                                                                                                                                       	 	 	 	 	 	 	 	     - -  
 - -         C o n t e n t s :   F u l l   T e x t   s e a r c h .           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 i f   ( S E L E C T   f u l l t e x t c a t a l o g p r o p e r t y ( ' F u l l T e x t C a t a l o g ' ,   ' A c c e n t S e n s i t i v i t y ' ) )   I S   N U L L  
 C R E A T E   F U L L T E X T   C A T A L O G   F u l l T e x t C a t a l o g  
           A S   D E F A U L T  
 G O  
  
 I F   N O T   E X I S T S   ( S E L E C T   1   F R O M   d b o . s y s o b j e c t s   W H E R E   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ F T S e a r c h a b l e B l o b S t o r a g e ] ' )   A N D   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ F T S e a r c h a b l e B l o b S t o r a g e ] (  
 	 [ B l o b I d ]   [ u n i q u e i d e n t i f i e r ]     N O T   N U L L   ,  
 	 [ F i l e N a m e ]   n v a r c h a r ( 2 5 6 )       N U L L   ,  
 	 [ E x t e n s i o n ]   n v a r c h a r ( 2 5 6 )     N O T   N U L L   ,  
 	 [ M a n a g e d T y p e I d ]   [ u n i q u e i d e n t i f i e r ]   N U L L   ,  
 	 [ V a l u e ]   [ v a r b i n a r y ]   ( m a x )   N U L L   ,  
   	 C O N S T R A I N T   [ P K _ F T S e a r c h a b l e B l o b S t o r a g e ]   P R I M A R Y   K E Y       	 ( [ B l o b I d ] )  
       )   O N   [ P R I M A R Y ]  
 G O  
  
 I F   N O T   E X I S T S   ( S E L E C T   1   F R O M   s y s . f u l l t e x t _ i n d e x e s   W H E R E   o b j e c t _ i d   =    
   O B J E C T _ I D ( ' d b o . F T S e a r c h a b l e B l o b S t o r a g e ' ) )  
 	 C R E A T E   F U L L T E X T   I N D E X   O N     [ d b o ] . [ F T S e a r c h a b l e B l o b S t o r a g e ]   	 ( [ V a l u e ]   T Y P E   C O L U M N   E x t e n s i o n )    
       	   K E Y   I N D E X   P K _ F T S e a r c h a b l e B l o b S t o r a g e  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :               E v e n t P a r t i t i o n s . s q l                                                                                         - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :                                                                                                                                     - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 0                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 0  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 0 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 0 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 0 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 0 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 0 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 0 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 0 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 0 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 0 ] . [ i d x c _ E v e n t _ 0 0 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 0 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 0 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 0 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 0 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 0 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 1                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 1  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 1 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 1 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 1 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 1 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 1 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 1 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 1 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 1 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 1 ] . [ i d x c _ E v e n t _ 0 1 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 1 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 1 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 1 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 1 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 1 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 2                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 2  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 2 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 2 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 2 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 2 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 2 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 2 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 2 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 2 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 2 ] . [ i d x c _ E v e n t _ 0 2 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 2 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 2 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 2 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 2 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 2 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 3                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 3  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 3 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 3 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 3 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 3 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 3 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 3 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 3 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 3 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 3 ] . [ i d x c _ E v e n t _ 0 3 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 3 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 3 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 3 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 3 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 3 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 4                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 4  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 4 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 4 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 4 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 4 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 4 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 4 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 4 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 4 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 4 ] . [ i d x c _ E v e n t _ 0 4 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 4 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 4 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 4 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 4 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 4 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 5                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 5  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 5 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 5 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 5 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 5 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 5 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 5 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 5 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 5 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 5 ] . [ i d x c _ E v e n t _ 0 5 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 5 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 5 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 5 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 5 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 5 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 6                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 6  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 6 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 6 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 6 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 6 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 6 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 6 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 6 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 6 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 6 ] . [ i d x c _ E v e n t _ 0 6 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 6 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 6 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 6 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 6 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 6 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 7                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 7  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 7 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 7 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 7 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 7 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 7 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 7 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 7 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 7 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 7 ] . [ i d x c _ E v e n t _ 0 7 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 7 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 7 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 7 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 7 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 7 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 8                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 8  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 8 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 8 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 8 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 8 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 8 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 8 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 8 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 8 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 8 ] . [ i d x c _ E v e n t _ 0 8 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 8 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 8 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 8 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 8 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 8 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 0 9                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 0 9  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 9 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 0 9 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 0 9 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 0 9 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 0 9 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 9 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 9 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 9 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 0 9 ] . [ i d x c _ E v e n t _ 0 9 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 0 9 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 0 9 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 0 9 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 0 9 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 0 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 0 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 0 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 0 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 0 9 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 0                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 0  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 0 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 0 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 0 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 0 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 0 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 0 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 0 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 0 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 0 ] . [ i d x c _ E v e n t _ 1 0 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 0 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 0 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 0 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 0 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 0 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 1                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 1  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 1 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 1 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 1 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 1 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 1 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 1 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 1 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 1 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 1 ] . [ i d x c _ E v e n t _ 1 1 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 1 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 1 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 1 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 1 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 1 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 2                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 2  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 2 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 2 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 2 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 2 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 2 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 2 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 2 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 2 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 2 ] . [ i d x c _ E v e n t _ 1 2 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 2 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 2 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 2 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 2 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 2 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 3                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 3  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 3 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 3 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 3 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 3 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 3 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 3 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 3 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 3 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 3 ] . [ i d x c _ E v e n t _ 1 3 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 3 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 3 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 3 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 3 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 3 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 4                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 4  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 4 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 4 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 4 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 4 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 4 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 4 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 4 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 4 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 4 ] . [ i d x c _ E v e n t _ 1 4 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 4 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 4 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 4 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 4 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 4 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 5                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 5  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 5 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 5 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 5 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 5 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 5 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 5 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 5 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 5 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 5 ] . [ i d x c _ E v e n t _ 1 5 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 5 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 5 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 5 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 5 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 5 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 6                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 6  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 6 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 6 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 6 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 6 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 6 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 6 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 6 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 6 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 6 ] . [ i d x c _ E v e n t _ 1 6 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 6 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 6 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 6 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 6 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 6 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 7                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 7  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 7 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 7 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 7 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 7 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 7 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 7 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 7 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 7 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 7 ] . [ i d x c _ E v e n t _ 1 7 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 7 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 7 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 7 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 7 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 7 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 8                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 8  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 8 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 8 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 8 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 8 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 8 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 8 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 8 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 8 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 8 ] . [ i d x c _ E v e n t _ 1 8 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 8 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 8 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 8 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 8 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 8 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 1 9                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 1 9  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 9 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 1 9 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 1 9 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 1 9 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 1 9 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 9 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 9 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 9 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 1 9 ] . [ i d x c _ E v e n t _ 1 9 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 1 9 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 1 9 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 1 9 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 1 9 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 1 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 1 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 1 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 1 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 1 9 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 0                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 0  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 0 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 0 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 0 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 0 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 0 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 0 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 0 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 0 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 0 ] . [ i d x c _ E v e n t _ 2 0 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 0 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 0 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 0 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 0 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 0 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 1                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 1  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 1 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 1 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 1 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 1 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 1 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 1 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 1 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 1 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 1 ] . [ i d x c _ E v e n t _ 2 1 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 1 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 1 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 1 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 1 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 1 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 2                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 2  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 2 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 2 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 2 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 2 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 2 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 2 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 2 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 2 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 2 ] . [ i d x c _ E v e n t _ 2 2 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 2 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 2 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 2 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 2 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 2 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 3                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 3  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 3 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 3 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 3 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 3 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 3 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 3 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 3 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 3 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 3 ] . [ i d x c _ E v e n t _ 2 3 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 3 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 3 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 3 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 3 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 3 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 4                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 4  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 4 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 4 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 4 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 4 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 4 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 4 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 4 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 4 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 4 ] . [ i d x c _ E v e n t _ 2 4 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 4 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 4 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 4 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 4 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 4 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 5                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 5  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 5 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 5 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 5 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 5 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 5 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 5 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 5 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 5 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 5 ] . [ i d x c _ E v e n t _ 2 5 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 5 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 5 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 5 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 5 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 5 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 6                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 6  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 6 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 6 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 6 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 6 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 6 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 6 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 6 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 6 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 6 ] . [ i d x c _ E v e n t _ 2 6 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 6 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 6 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 6 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 6 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 6 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 7                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 7  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 7 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 7 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 7 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 7 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 7 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 7 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 7 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 7 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 7 ] . [ i d x c _ E v e n t _ 2 7 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 7 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 7 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 7 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 7 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 7 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 8                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 8  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 8 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 8 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 8 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 8 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 8 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 8 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 8 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 8 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 8 ] . [ i d x c _ E v e n t _ 2 8 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 8 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 8 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 8 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 8 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 8 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 2 9                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 2 9  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 9 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 2 9 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 2 9 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 2 9 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 2 9 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 9 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 9 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 9 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 2 9 ] . [ i d x c _ E v e n t _ 2 9 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 2 9 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 2 9 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 2 9 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 2 9 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 2 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 2 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 2 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 2 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 2 9 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 0                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 0  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 0 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 0 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 0 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 0 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 0 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 0 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 0 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 0 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 0 ] . [ i d x c _ E v e n t _ 3 0 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 0 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 0 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 0 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 0 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 0 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 1                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 1  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 1 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 1 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 1 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 1 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 1 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 1 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 1 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 1 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 1 ] . [ i d x c _ E v e n t _ 3 1 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 1 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 1 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 1 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 1 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 1 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 2                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 2  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 2 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 2 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 2 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 2 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 2 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 2 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 2 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 2 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 2 ] . [ i d x c _ E v e n t _ 3 2 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 2 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 2 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 2 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 2 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 2 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 3                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 3  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 3 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 3 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 3 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 3 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 3 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 3 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 3 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 3 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 3 ] . [ i d x c _ E v e n t _ 3 3 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 3 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 3 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 3 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 3 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 3 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 4                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 4  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 4 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 4 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 4 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 4 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 4 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 4 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 4 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 4 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 4 ] . [ i d x c _ E v e n t _ 3 4 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 4 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 4 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 4 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 4 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 4 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 5                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 5  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 5 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 5 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 5 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 5 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 5 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 5 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 5 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 5 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 5 ] . [ i d x c _ E v e n t _ 3 5 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 5 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 5 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 5 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 5 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 5 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 6                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 6  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 6 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 6 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 6 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 6 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 6 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 6 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 6 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 6 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 6 ] . [ i d x c _ E v e n t _ 3 6 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 6 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 6 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 6 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 6 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 6 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 7                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 7  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 7 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 7 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 7 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 7 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 7 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 7 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 7 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 7 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 7 ] . [ i d x c _ E v e n t _ 3 7 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 7 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 7 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 7 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 7 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 7 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 8                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 8  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 8 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 8 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 8 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 8 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 8 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 8 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 8 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 8 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 8 ] . [ i d x c _ E v e n t _ 3 8 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 8 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 8 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 8 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 8 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 8 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 3 9                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 3 9  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 9 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 3 9 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 3 9 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 3 9 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 3 9 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 9 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 9 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 9 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 3 9 ] . [ i d x c _ E v e n t _ 3 9 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 3 9 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 3 9 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 3 9 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 3 9 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 3 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 3 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 3 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 3 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 3 9 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 0                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 0  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 0 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 0 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 0 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 0 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 0 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 0 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 0 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 0 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 0 ] . [ i d x c _ E v e n t _ 4 0 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 0 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 0 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 0 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 0 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 0 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 1                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 1  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 1 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 1 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 1 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 1 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 1 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 1 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 1 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 1 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 1 ] . [ i d x c _ E v e n t _ 4 1 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 1 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 1 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 1 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 1 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 1 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 2                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 2  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 2 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 2 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 2 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 2 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 2 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 2 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 2 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 2 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 2 ] . [ i d x c _ E v e n t _ 4 2 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 2 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 2 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 2 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 2 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 2 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 3                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 3  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 3 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 3 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 3 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 3 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 3 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 3 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 3 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 3 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 3 ] . [ i d x c _ E v e n t _ 4 3 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 3 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 3 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 3 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 3 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 3 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 4                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 4  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 4 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 4 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 4 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 4 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 4 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 4 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 4 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 4 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 4 ] . [ i d x c _ E v e n t _ 4 4 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 4 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 4 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 4 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 4 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 4 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 5                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 5  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 5 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 5 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 5 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 5 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 5 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 5 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 5 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 5 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 5 ] . [ i d x c _ E v e n t _ 4 5 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 5 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 5 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 5 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 5 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 5 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 6                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 6  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 6 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 6 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 6 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 6 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 6 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 6 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 6 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 6 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 6 ] . [ i d x c _ E v e n t _ 4 6 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 6 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 6 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 6 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 6 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 6 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 7                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 7  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 7 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 7 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 7 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 7 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 7 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 7 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 7 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 7 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 7 ] . [ i d x c _ E v e n t _ 4 7 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 7 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 7 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 7 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 7 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 7 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 8                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 8  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 8 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 8 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 8 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 8 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 8 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 8 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 8 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 8 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 8 ] . [ i d x c _ E v e n t _ 4 8 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 8 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 8 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 8 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 8 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 8 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 4 9                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 4 9  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 9 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 4 9 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 4 9 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 4 9 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 4 9 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 9 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 9 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 9 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 4 9 ] . [ i d x c _ E v e n t _ 4 9 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 4 9 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 4 9 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 4 9 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 4 9 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 4 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 4 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 4 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 4 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 4 9 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 0                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 0  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 0 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 0 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 0 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 0 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 0 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 0 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 0 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 0 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 0 ] . [ i d x c _ E v e n t _ 5 0 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 0 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 0 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 0 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 0 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 0 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 1                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 1  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 1 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 1 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 1 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 1 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 1 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 1 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 1 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 1 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 1 ] . [ i d x c _ E v e n t _ 5 1 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 1 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 1 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 1 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 1 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 1 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 1 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 2                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 2  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 2 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 2 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 2 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 2 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 2 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 2 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 2 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 2 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 2 ] . [ i d x c _ E v e n t _ 5 2 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 2 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 2 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 2 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 2 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 2 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 2 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 3                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 3  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 3 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 3 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 3 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 3 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 3 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 3 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 3 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 3 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 3 ] . [ i d x c _ E v e n t _ 5 3 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 3 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 3 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 3 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 3 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 3 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 3 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 4                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 4  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 4 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 4 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 4 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 4 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 4 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 4 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 4 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 4 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 4 ] . [ i d x c _ E v e n t _ 5 4 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 4 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 4 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 4 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 4 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 4 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 4 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 5                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 5  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 5 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 5 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 5 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 5 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 5 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 5 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 5 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 5 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 5 ] . [ i d x c _ E v e n t _ 5 5 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 5 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 5 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 5 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 5 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 5 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 5 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 6                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 6  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 6 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 6 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 6 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 6 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 6 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 6 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 6 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 6 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 6 ] . [ i d x c _ E v e n t _ 5 6 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 6 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 6 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 6 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 6 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 6 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 6 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 7                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 7  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 7 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 7 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 7 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 7 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 7 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 7 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 7 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 7 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 7 ] . [ i d x c _ E v e n t _ 5 7 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 7 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 7 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 7 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 7 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 7 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 7 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 8                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 8  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 8 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 8 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 8 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 8 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 8 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 8 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 8 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 8 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 8 ] . [ i d x c _ E v e n t _ 5 8 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 8 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 8 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 8 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 8 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 8 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 8 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 5 9                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 5 9  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 9 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 5 9 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 5 9 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 5 9 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 5 9 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 9 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 9 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 9 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 5 9 ] . [ i d x c _ E v e n t _ 5 9 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 5 9 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 5 9 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 5 9 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 5 9 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 5 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 5 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 5 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 5 9 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 5 9 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                                   E v e n t _ 6 0                                       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   E v e n t _ 6 0  
 I F   N O T   E X I S T S ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 6 0 ] ' )   a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ E v e n t _ 6 0 ]  
 (  
         [ E v e n t I d ]     u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ E v e n t O r i g i n a l I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ R u l e I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P u b l i s h e r N a m e ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ F u l l N u m b e r ]   i n t   N O T   N U L L ,  
         [ N u m b e r ]   i n t   N O T   N U L L ,  
         [ C a t e g o r y ]   i n t   N U L L ,  
         [ U s e r ]   n v a r c h a r ( 2 5 5 )   N O T   N U L L ,  
         [ C h a n n e l ]   n v a r c h a r ( 2 5 5 ) ,  
         [ L e v e l ]   i n t ,  
         [ L o g g i n g C o m p u t e r ]   n v a r c h a r ( 4 0 0 )   N O T   N U L L ,  
         [ E v e n t D a t a ]   n v a r c h a r ( m a x )   N U L L ,  
         [ E v e n t P a r a m e t e r s ]   n v a r c h a r ( m a x )   N U L L ,  
         [ T i m e G e n e r a t e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L  
 )  
 G O  
  
 - -   A d d i n g   d e f a u t   v a l u e   t o   T i m e A d d e d  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . C O L U M N S   W H E R E   T A B L E _ N A M E   =   N ' E v e n t _ 6 0 '  
                       A N D   C O L U M N _ N A M E   =   N ' T i m e A d d e d '   A N D   C O L U M N _ D E F A U L T   I S   N U L L )  
 B E G I N  
         A L T E R   T A B L E   [ d b o ] . [ E v e n t _ 6 0 ]  
         A D D   C O N S T R A I N T   [ D F _ E v e n t _ 6 0 _ T i m e A d d e d ]   D E F A U L T   g e t u t c d a t e ( )   F O R   [ T i m e A d d e d ]  
 E N D  
 G O  
  
 - -   D r o p   t h e   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 6 0 _ T i m e G e n e r a t e d  
 I F   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 6 0 _ T i m e G e n e r a t e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 6 0 ] ' ) )  
 B E G I N    
         D R O P   I N D E X   [ d b o ] . [ E v e n t _ 6 0 ] . [ i d x c _ E v e n t _ 6 0 _ T i m e G e n e r a t e d ]  
 E N D  
 G O  
  
  
 - -   C l u s t e r e d   I n d e x   i d x c _ E v e n t _ 6 0 _ T i m e A d d e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ E v e n t _ 6 0 _ T i m e A d d e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 6 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 6 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ E v e n t _ 6 0 _ T i m e A d d e d ]   O N   [ d b o ] . [ E v e n t _ 6 0 ] ( [ T i m e A d d e d ] )  
 E N D  
 G O  
  
  
 - -   N o n - c l u s t e r e d   I n d e x   i d x _ E v e n t _ 6 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ E v e n t _ 6 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ E v e n t _ 6 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ E v e n t _ 6 0 _ B a s e M a n a g e d E n t i t y I n t e r n a l I d ]   O N   [ d b o ] . [ E v e n t _ 6 0 ] ( [ B a s e M a n a g e d E n t i t y I n t e r n a l I d ] )  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :               P e r f o r m a n c e D a t a P a r t i t i o n s . s q l                                                                     - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :                                                                                                                                     - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 0                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 0  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 0 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 0 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 0 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 0 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 1                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 1  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 1 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 1 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 1 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 1 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 2                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 2  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 2 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 2 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 2 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 2 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 3                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 3  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 3 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 3 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 3 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 3 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 4                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 4  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 4 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 4 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 4 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 4 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 5                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 5  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 5 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 5 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 5 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 5 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 6                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 6  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 6 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 6 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 6 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 6 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 7                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 7  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 7 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 7 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 7 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 7 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 8                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 8  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 8 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 8 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 8 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 8 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 0 9                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 0 9  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 0 9 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 0 9 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 0 9 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 0 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 0 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 0 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 0 9 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 0                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 0  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 0 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 0 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 0 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 0 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 1                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 1  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 1 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 1 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 1 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 1 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 2                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 2  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 2 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 2 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 2 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 2 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 3                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 3  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 3 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 3 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 3 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 3 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 4                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 4  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 4 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 4 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 4 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 4 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 5                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 5  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 5 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 5 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 5 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 5 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 6                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 6  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 6 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 6 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 6 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 6 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 7                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 7  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 7 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 7 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 7 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 7 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 8                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 8  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 8 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 8 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 8 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 8 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 1 9                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 1 9  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 1 9 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 1 9 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 1 9 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 1 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 1 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 1 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 1 9 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 0                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 0  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 0 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 0 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 0 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 0 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 1                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 1  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 1 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 1 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 1 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 1 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 2                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 2  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 2 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 2 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 2 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 2 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 3                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 3  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 3 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 3 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 3 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 3 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 4                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 4  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 4 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 4 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 4 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 4 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 5                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 5  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 5 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 5 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 5 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 5 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 6                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 6  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 6 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 6 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 6 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 6 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 7                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 7  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 7 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 7 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 7 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 7 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 8                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 8  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 8 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 8 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 8 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 8 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 2 9                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 2 9  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 2 9 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 2 9 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 2 9 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 2 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 2 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 2 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 2 9 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 0                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 0  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 0 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 0 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 0 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 0 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 1                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 1  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 1 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 1 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 1 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 1 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 2                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 2  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 2 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 2 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 2 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 2 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 3                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 3  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 3 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 3 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 3 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 3 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 4                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 4  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 4 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 4 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 4 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 4 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 5                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 5  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 5 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 5 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 5 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 5 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 6                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 6  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 6 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 6 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 6 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 6 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 7                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 7  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 7 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 7 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 7 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 7 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 8                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 8  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 8 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 8 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 8 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 8 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 3 9                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 3 9  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 3 9 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 3 9 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 3 9 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 3 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 3 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 3 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 3 9 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 0                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 0  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 0 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 0 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 0 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 0 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 1                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 1  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 1 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 1 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 1 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 1 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 2                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 2  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 2 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 2 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 2 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 2 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 3                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 3  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 3 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 3 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 3 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 3 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 4                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 4  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 4 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 4 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 4 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 4 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 5                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 5  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 5 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 5 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 5 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 5 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 6                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 6  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 6 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 6 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 6 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 6 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 7                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 7  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 7 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 7 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 7 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 7 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 8                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 8  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 8 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 8 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 8 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 8 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 4 9                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 4 9  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 4 9 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 4 9 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 4 9 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 4 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 4 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 4 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 4 9 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 0                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 0  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 0 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 0 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 0 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 0 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 1                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 1  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 1 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 1 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 1 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 1 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 1 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 1 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 2                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 2  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 2 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 2 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 2 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 2 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 2 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 2 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 3                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 3  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 3 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 3 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 3 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 3 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 3 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 3 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 4                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 4  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 4 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 4 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 4 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 4 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 4 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 4 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 5                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 5  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 5 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 5 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 5 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 5 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 5 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 5 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 6                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 6  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 6 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 6 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 6 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 6 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 6 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 6 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 7                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 7  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 7 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 7 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 7 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 7 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 7 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 7 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 8                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 8  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 8 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 8 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 8 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 8 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 8 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 8 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 5 9                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 5 9  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 5 9 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 5 9 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 5 9 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 9 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 5 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 5 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 5 9 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 5 9 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -                             P e r f o r m a n c e D a t a _ 6 0                             - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   P a r t i t i o n   P e r f o r m a n c e D a t a _ 6 0  
 I F   N O T   E X I S T S   ( s e l e c t   *   f r o m   s y s o b j e c t s   w h e r e   i d   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ] ' )     a n d   O B J E C T P R O P E R T Y ( i d ,   N ' I s U s e r T a b l e ' )   =   1 )  
 C R E A T E   T A B L E   [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ]  
 (  
         [ P e r f o r m a n c e D a t a I d ]   u n i q u e i d e n t i f i e r   N O T   N U L L ,  
         [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   i n t   N O T   N U L L ,  
         [ S a m p l e V a l u e ]   f l o a t   N U L L ,  
         [ T i m e S a m p l e d ]   d a t e t i m e   N O T   N U L L ,  
         [ T i m e A d d e d ]   d a t e t i m e   N O T   N U L L    
 )  
 G O  
  
 - -   C l u s t e r e d   i n d e x   i d x c _ P e r f o r m a n c e D a t a _ 6 0 _ T i m e S a m p l e d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x c _ P e r f o r m a n c e D a t a _ 6 0 _ T i m e S a m p l e d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ] ' ) )  
 A N D   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I   W H E R E   I . i n d i d   =   1   A N D     I . [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ] ' ) )  
 B E G I N    
         C R E A T E   C L U S T E R E D   I N D E X   [ i d x c _ P e r f o r m a n c e D a t a _ 6 0 _ T i m e S a m p l e d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ] ( T i m e S a m p l e d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 6 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 6 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ] ' ) )  
 B E G I N    
         C R E A T E   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 6 0 _ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ] ( P e r f o r m a n c e S o u r c e I n t e r n a l I d )  
 E N D  
 G O  
  
 - -   N o n - c l u s t e r e d   i n d e x   i d x _ P e r f o r m a n c e D a t a _ 6 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d  
 I F   N O T   E X I S T S   ( S E L E C T   I . [ i d ]   F R O M   s y s i n d e x e s   A S   I  
                               W H E R E   I . [ n a m e ]   =   ' i d x _ P e r f o r m a n c e D a t a _ 6 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d '   A N D   [ i d ]   =   o b j e c t _ i d ( N ' [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ] ' ) )  
 B E G I N    
         C R E A T E   N O N C L U S T E R E D   I N D E X   [ i d x _ P e r f o r m a n c e D a t a _ 6 0 _ P e r f I d _ T i m e S a m p l e d _ T i m e A d d ]   O N   [ d b o ] . [ P e r f o r m a n c e D a t a _ 6 0 ]  
 	 (   [ P e r f o r m a n c e S o u r c e I n t e r n a l I d ]   A S C ,   [ T i m e S a m p l e d ]   A S C   )  
 	 I N C L U D E   (   [ P e r f o r m a n c e D a t a I d ] ,   [ S a m p l e V a l u e ] ,   [ T i m e A d d e d ]   )   O N   [ P R I M A R Y ]  
 E N D  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -         ( c )   C o p y r i g h t   2 0 0 5 - 2 0 0 6 ,   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d         - -  
 - -         P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                     - -  
 - -                                                                                                                                                       - -  
 - -         F i l e :   E v e n t V i e w s B a s e . s q l                                                                                   - -  
 - -                                                                                                                                                       - -  
 - -         C o n t e n t s :   T h i s   f i l e   c o n t a i n s   t h e   d e f i n i t i o n   o f   v i e w s   f o r   o p e r a t i o n a l       - -  
 - -                             d a t a   i n   t h e   M O M   V 3   o p e r a t i o n a l   d a t a b a s e .                                           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C r e a t i n g   E v e n t   i n s e r t i o n   v i e w   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 I F   E X I S T S   (   S E L E C T   T A B L E _ N A M E   F R O M   I N F O R M A T I O N _ S C H E M A . V I E W S   W H E R E   T A B L E _ N A M E   =   ' E v e n t I n s e r t V i e w ' )  
 D R O P   V I E W   d b o . E v e n t I n s e r t V i e w  
 G O  
  
 C R E A T E   V I E W   d b o . E v e n t I n s e r t V i e w   A S  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 0    
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C r e a t i n g   P e r f o r m a n c e D a t a   i n s e r t i o n   v i e w   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 I F   E X I S T S   (   S E L E C T   T A B L E _ N A M E   F R O M   I N F O R M A T I O N _ S C H E M A . V I E W S   W H E R E   T A B L E _ N A M E   =   ' P e r f o r m a n c e D a t a I n s e r t V i e w ' )  
 D R O P   V I E W   d b o . P e r f o r m a n c e D a t a I n s e r t V i e w  
 G O  
  
 C R E A T E   V I E W   d b o . P e r f o r m a n c e D a t a I n s e r t V i e w   A S  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 0  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C r e a t i n g   E v e n t A l l   v i e w  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 I F   E X I S T S   (   S E L E C T   T A B L E _ N A M E   F R O M   I N F O R M A T I O N _ S C H E M A . V I E W S   W H E R E   T A B L E _ N A M E   =   ' E v e n t A l l V i e w ' )  
 D R O P   V I E W   d b o . E v e n t A l l V i e w  
 G O  
  
 C R E A T E   V I E W   d b o . E v e n t A l l V i e w   A S  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 0 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 1 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 2 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 3 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 4 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 5 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . E v e n t _ 6 0  
  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C r e a t i n g   P e r f o r m a n c e D a t a A l l   v i e w  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 I F   E X I S T S   (   S E L E C T   T A B L E _ N A M E   F R O M   I N F O R M A T I O N _ S C H E M A . V I E W S   W H E R E   T A B L E _ N A M E   =   ' P e r f o r m a n c e D a t a A l l V i e w ' )  
 D R O P   V I E W   d b o . P e r f o r m a n c e D a t a A l l V i e w  
 G O  
  
 C R E A T E   V I E W   d b o . P e r f o r m a n c e D a t a A l l V i e w   A S  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 0 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 1 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 2 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 3 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 4 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 0   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 1   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 2   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 3   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 4   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 5   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 6   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 7   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 8   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 5 9   U N I O N   A L L  
         S E L E C T   *   F R O M   d b o . P e r f o r m a n c e D a t a _ 6 0  
  
  
 G O  
  
  
  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             S e c u r i t y S p r o c s . s q l                                                                                             - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   S p r o c s   t o   c r e a t e   l o g i n s ,   g r a n t   p e r m i s s i o n   t o   d b ,   e t c                           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -  
 - -   S p r o c   N a m e :   p _ S e t u p C r e a t e L o g i n  
 - -   D e s c r i p t i o n :   C r e a t e s   a   S Q L   l o g i n   i n   t h e   s e r v e r ,   g r a n t s   i t   a c c e s s   t o   t h e   d a t a b a s e  
 - -                             a n d   a d d s   i t   t o   t h e   g i v e n   r o l e .  
 - -   C a l l e r :   S e t u p  
 - -                   T h i s   s p r o c   w i l l   b e   c a l l e d   b y   s e t u p   a f t e r   t h e   s e t u p   s c r i p t   r u n s .  
 - -  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ S e t u p C r e a t e L o g i n '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ S e t u p C r e a t e L o g i n  
 G O  
  
 C R E A T E   P R O C E D U R E   d b o . p _ S e t u p C r e a t e L o g i n  
 (  
         @ L o g i n N a m e   s y s n a m e ,  
         @ R o l e N a m e   s y s n a m e  
 )  
 A S  
 B E G I N  
  
         D E C L A R E   @ S i d   v a r b i n a r y ( 8 5 )  
         D E C L A R E   @ U s e r N a m e   s y s n a m e  
         D E C L A R E   @ E r r   i n t  
         D E C L A R E   @ Q r y   N V A R C H A R ( 4 0 0 0 )  
  
         S E T   N O C O U N T   O N      
  
         - -   V e r i f y i n g   i f   L o g i n   a l r e a d y   h a s   a c c e s s   t o   t h e   s e r v e r  
         I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   m a s t e r . . s y s l o g i n s   W H E R E   U P P E R ( R T R I M ( L T R I M ( [ n a m e ] ) ) )   =   U P P E R ( R T R I M ( L T R I M ( @ L o g i n N a m e ) ) ) )  
         B E G I N  
 	 	 S E L E C T   @ Q r y   =   ' C R E A T E   L O G I N   [ '   +   @ L o g i n N a m e   +   ' ]   F R O M   W I N D O W S '  
  
                 - -   G r a n t i n g   t h e   l o g i n   a c c e s s   t o   t h e   s e r v e r  
                 E X E C ( @ Q r y )  
                  
                 S E T   @ E r r   =   @ @ E R R O R  
    
                 I F   ( @ E r r   < >   0 )    
                 B E G I N  
                         G O T O   E r r o r _ E x i t  
                 E N D  
         E N D  
  
         - -   S e l e c t   t h e   s i d   o f   t h e   l o g i n .   Q u e r y i n g   f o r   t h e   s i d   i s   t h e   o n l y  
         - -   w a y   t o   b e   c e r t a i n   t h a t   t h e   l o g i n   d o e s n ' t   a l r e a d y   h a v e   p e r m i s s i o n s  
         - -   i n   t h e   d a t a b a s e .  
         S E L E C T   @ S i d   =   s i d   F R O M   m a s t e r . . s y s l o g i n s   W H E R E   U P P E R ( R T R I M ( L T R I M ( [ l o g i n n a m e ] ) ) )   =   U P P E R ( R T R I M ( L T R I M ( @ L o g i n N a m e ) ) )  
  
         - -   W e   m u s t   h a v e   a   s i d   b y   n o w ,   o t h e r w i s e   i t ' s   a n   e r r o r .          
         I F   ( @ S i d   I S   N U L L )   G O T O   E r r o r _ E x i t  
  
         - -   V e r i f y   i f   t h e   s i d   a l r e a d y   h a s   a c c e s s   t o   t h e   d a t a b a s e  
         S E L E C T   @ U s e r N a m e   =   [ n a m e ]   F R O M   s y s u s e r s   W H E R E   [ s i d ]   =   @ S i d    
  
         - -   I f   t h e   n a m e   i s   N U L L ,   t h e   l o g i n   d o e s n ' t   h a v e   p e r m i s s i o n s  
         - -   i n   t h e   D B   y e t ,   s o   w e   m u s t   a d d   i t .  
         I F   ( @ U s e r N a m e   I S   N U L L )  
         B E G I N  
 	 	 S E L E C T   @ Q r y   =   ' C R E A T E   U S E R   [ '   +   @ L o g i n N a m e   +   ' ]   F O R   L O G I N   [ '   +   @ L o g i n N a m e   +   ' ] '  
  
                 - -   G r a n t   t h e   l o g i n   a c c e s s   t o   t h i s   d a t a b a s e .    
                 - -   W e   a r e   m a k i n g   t h e   u s e r   n a m e   i n   t h e   d a t a b a s e   m a t c h   t h e   l o g i n   n a m e .  
                 E X E C ( @ Q r y )  
  
                 S E T   @ E r r   =   @ @ E R R O R  
    
                 I F   ( @ E r r   < >   0 )    
                 B E G I N  
                         G O T O   E r r o r _ E x i t  
                 E N D  
  
                 - -   U p d a t e   t h e   u s e r   n a m e   i n   t h e   D B   w i t h   t h e   l o g i n   n a m e ,   s i n c e  
                 - -   t h a t ' s   t h e   n a m e   w e   g a v e   i n   s p _ g r a n t d b a c c e s s .   W e   w i l l   n e e d   t o  
                 - -   h a v e   t h e   c o r r e c t   U s e r N a m e   w h e n   c a l l i n g   s p _ a d d r o l e m e m b e r .  
                 S E T   @ U s e r N a m e   =   @ L o g i n N a m e  
         E N D  
         - -   W h e n   t h e   g i v e n   l o g i n   w a s   t h e   o n e   t h a t   c r e a t e d   t h e   d a t a b a s e ,    
         - -   S Q L   S e r v e r   a u t o m a t i c a l l y   g i v e s   i t   p e r m i s s i o n   t o   t h e   d a t a b a s e   a n d   a s s i g n s  
         - -   u s e r   d b o   t o   t h e   l o g i n .    
         E L S E   I F   @ U s e r N a m e   =   ' d b o '  
         B E G I N  
                 - -   I f   t h e   l o g i n   i s   a l r e a d y   t h e   d b o ,   t h e r e ' s   n o   p o i n t   i n   a s s i g n i n g   i t  
                 - -   t o   a n y   o t h e r   r o l e s   ( a c t u a l l y ,   S Q L S e r v e r   w o n ' t   l e t   y o u ) .   S o   w e   j u s t  
                 - -   l e a v e   t h e   s p r o c ,   s i n c e   t h e   l o g i n   a l r e a d y   h a s   m o r e   t h a n   e n o u g h  
                 - -   p e r m i s s i o n s .  
                 G O T O   S u c c e s s _ E x i t  
         E N D          
  
         - -   A d d i n g   t h e   u s e r   t o   t h e   g i v e n   r o l e   ( t h a t   s h o u l d   h a v e   b e e n   c r e a t e d  
         - -   a l r e a d y   a t   t h e   t i m e   t h e   s c r i p t   w a s   r u n ) .   W e   m u s t   u s e   t h e   u s e r   n a m e  
         - -   ( w h i c h   m i g h t   n o t   n e c e s s a r i l y   b e   i d e n t i c a l   t o   t h e   L o g i n N a m e ) .  
         E X E C   s p _ a d d r o l e m e m b e r   @ R o l e N a m e ,   @ U s e r N a m e  
  
         S E T   @ E r r   =   @ @ E R R O R  
    
         I F   ( @ E r r   < >   0 )    
         B E G I N  
                 G O T O   E r r o r _ E x i t  
         E N D  
  
 S u c c e s s _ E x i t :  
  
         R E T U R N   0  
  
 E r r o r _ E x i t :  
  
         R E T U R N   1  
  
 E N D  
 G O  
  
 - -  
 - -   S p r o c   N a m e :   p _ G r a n t A l t e r L o g i n  
 - -   D e s c r i p t i o n :   G r a n t s   a l t e r   l o g i n   p e r m i s s i o n   t o   t h e   g i v e n   l o g i n  
 - -  
 - -   C a l l e r :   S e t u p  
 - -                   T h i s   s p r o c   w i l l   b e   c a l l e d   b y   s e t u p   a f t e r   t h e   s e t u p   s c r i p t   r u n s .  
 - -  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ G r a n t A l t e r L o g i n '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ G r a n t A l t e r L o g i n  
 G O  
  
 C R E A T E   P R O C E D U R E   d b o . p _ G r a n t A l t e r L o g i n  
 (  
         @ L o g i n N a m e   s y s n a m e  
 )  
 A S  
 B E G I N  
  
         D E C L A R E   @ E r r   i n t  
         D E C L A R E   @ s t m t   n v a r c h a r ( 4 0 0 0 )  
  
         S E T   N O C O U N T   O N      
  
         - -   F o r m   g r a n t   a l t e r   s t a t e m e n t  
         S E L E C T   @ s t m t   =   ' E X E C   m a s t e r . . s p _ a d d s r v r o l e m e m b e r   '  
         S E L E C T   @ s t m t   =   @ s t m t   +   Q U O T E N A M E ( @ L o g i n N a m e ,   ' ] ' )   +   ' ,   ' ' s e c u r i t y a d m i n ' ' ;   '  
         E X E C   ( @ s t m t )  
  
         S E T   @ E r r   =   @ @ E R R O R  
         I F   ( @ E r r   < >   0 )    
         B E G I N  
               G O T O   E r r o r _ E x i t  
         E N D                  
  
 S u c c e s s _ E x i t :  
  
         R E T U R N   0  
  
 E r r o r _ E x i t :  
  
         R E T U R N   1  
  
 E N D  
  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d           - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                     - -  
 - -                                                                                                                                                   - -  
 - -     F i l e :               E r r o r M e s s a g e s . s q l                                                                                     - -  
 - -                                                                                                                                                   - -  
 - -     C o n t e n t s :     C o n t a i n s   M O M - s p e c i f i c   e r r o r   m e s s a g e s                                                 - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -         M O M v 3   m e s s a g e s   a r e   7 7 7 9 8 x x x x           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   D i s c o v e r y   r a n g e :   7 7 7 9 8 - 0 0 0 0   t o   7 7 7 9 8 - 0 0 4 9   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   M a n a g e d   t y p e   d o e s n ' t   e x i s t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 0 ,   @ m s g t e x t   =   N ' T h e   s p e c i f i e d   m a n a g e d   t y p e   d o e s n ' ' t   e x i s t . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   R e l a t i o n s h i p   t y p e   d o e s n ' t   e x i s t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 1 ,   @ m s g t e x t   =   N ' T h e   s p e c i f i e d   r e l a t i o n s h i p   t y p e   d o e s n ' ' t   e x i s t . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   S o u r c e   e n t i t y   o f   t h e   r e l a t i o n s h i p   d o e s n ' t   e x i s t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 2 ,   @ m s g t e x t   =   N ' T h e   s p e c i f i e d   r e l a t i o n s h i p   d o e s n ' ' t   h a v e   a   v a l i d   s o u r c e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   T a r g e t   e n t i t y   o f   t h e   r e l a t i o n s h i p   d o e s n ' t   e x i s t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 3 ,   @ m s g t e x t   =   N ' T h e   s p e c i f i e d   r e l a t i o n s h i p   d o e s n ' ' t   h a v e   a   v a l i d   t a r g e t . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D i s c o v e r y   d a t a   f r o m   i n v a l i d   m a n a g e d   e n t i t y   i s   d r o p p e d .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 4 ,   @ m s g t e x t   =   N ' D i s c o v e r y   d a t a   h a s   b e e n   r e c e i v e d   f r o m   a   r u l e   t a r g e t e d   t o   a   n o n - e x i s t e n t   e n t i t y .   T h e   d i s c o v e r y   d a t a   w i l l   b e   d r o p p e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   I n v a l i d   r e l a t i o n s h i p   r e j e c t e d   b y   c y c l e   d e t e c t i o n .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 5 ,   @ m s g t e x t   =   N ' R e l a t i o n s h i p   { % s }   w a s   r e j e c t e d   b e c a u s e   i t   w o u l d   c a u s e   a   c o n t a i n m e n t   c y c l e ;   r e l a t i o n s h i p   s o u r c e   =   ' ' % s ' '   a n d   t a r g e t   =   ' ' % s ' ' . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D i s c o v e r y   d a t a   g e n e r a t e d   b y   i n v a l i d   c o n n e c t o r .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 6 ,   @ m s g t e x t   =   N ' D i s c o v e r y   d a t a   g e n e r a t e d   b y   i n v a l i d   c o n n e c t o r : % s . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D i s c o v e r y   d a t a   g e n e r a t e d   b y   i n v a l i d   r u l e ,   t a s k ,   d i s c o v e r y .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 7 ,   @ m s g t e x t   =   N ' D i s c o v e r y   d a t a   g e n e r a t e d   b y   i n v a l i d   d i s c o v e r y   s o u r c e .   I d : % s . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   H e a l t h   s e r v i c e   s h o u l d   n o t   g e n e r a t e   d a t a   a b o u t   t h i s   m a n a g e d   o b j e c t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 8 ,   @ m s g t e x t   =   N ' H e a l t h   s e r v i c e   (   % s   )   s h o u l d   n o t   g e n e r a t e   d a t a   a b o u t   t h i s   m a n a g e d   t y p e   (   % s   )   o b j e c t   I d   (   % s   ) . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   H e a l t h   s e r v i c e   s h o u l d   n o t   g e n e r a t e   d a t a   a b o u t   t h i s   r e l a t i o n s h i p   o b j e c t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 0 9 ,   @ m s g t e x t   =   N ' H e a l t h   s e r v i c e   (   % s   )   s h o u l d   n o t   g e n e r a t e   d a t a   a b o u t   t h i s   r e l a t i o n s h i p   o b j e c t   b e t w e e n   (   % s   a n d   % s   ) . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   I n s t a n c e   l a s t   m o d i f i c a t i o n   i s   m o r e   r e c e n t   t h a n   s u b m i t t e d .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 1 0 ,   @ m s g t e x t   =   N '   I n s t a n c e   I d   =   { % s }   l a s t   m o d i f i c a t i o n   i s   m o r e   r e c e n t   t h a n   s u b m i t t e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   L i f e t i m e   d e p e n d e n c y   a l r e a d y   s e t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 1 1 ,   @ m s g t e x t   =   N '   I n s t a n c e   i d   =   { % s }   a l r e a d y   h a s   l i f e t i m e   d e p e n d e n c y   d e f i n e d   b y   r e l a t i o n s h i p   i d   =   ( % s ) . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   A v a i l a b i l i t y   &   M a i n t e n a n c e   M o d e   r a n g e :   7 7 7 9 8 - 0 0 5 0   t o   7 7 7 9 8 - 0 0 9 9   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   C a n   n o t   s e t   a v a i l a b i l i t y   o n   a   h e a l t h   s e r v i c e   t h a t   d o e s n ' t   e x i s t .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 0 ,   @ m s g t e x t   =   N ' C a n n o t   s e t   a v a i l a b i l i t y   o n   a   h e a l t h   s e r v i c e   t h a t   d o e s n ' ' t   e x i s t . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   M a n a g e d   e n t i t y   i s   n o t   c u r r e n t l y   i n   m a i n t e n a n c e   m o d e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 1 ,   @ m s g t e x t   =   N ' M a n a g e d   e n t i t y   i s   n o t   c u r r e n t l y   i n   m a i n t e n a n c e   m o d e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   E n d   t i m e   h a s   t o   b e   g r e a t e r   t h a n   s t a r t   t i m e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 2 ,   @ m s g t e x t   =   N ' T h e   m a i n t e n a n c e   m o d e   s c h e d u l e d   e n d   t i m e   h a s   t o   b e   g r e a t e r   t h a n   t h e   s t a r t   t i m e   o r   y o u   m i g h t   n o t   h a v e   p e r m i s s o n   o n   t h e   s c h e d u l e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   S c h e d u l e d E n d T i m e   c a n ' t   b e   i n   t h e   p a s t  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 3 ,   @ m s g t e x t   =   N ' C a n n o t   s e t   s c h e d u l e d   e n d   t i m e   t o   a   t i m e   i n   t h e   p a s t ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   O p e r a t i o n   N o t   P e r m i t t e d   o n   A c t i v e   S c h e d u l e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 4 ,   @ m s g t e x t   =   N ' O p e r a t i o n   n o t   p e r m i t t e d   o n   a n   a c t i v e   s c h e d u l e   o r   y o u   m i g h t   n o t   h a v e   p e r m i s s o n   o n   t h e   s c h e d u l e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   O p e r a t i o n   N o t   P e r m i t t e d   o n   I n a c t i v e   S c h e d u l e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 5 ,   @ m s g t e x t   =   N ' O p e r a t i o n   n o t   p e r m i t t e d   o n   i n a c t i v e   s c h e d u l e   o r   y o u   m i g h t   n o t   h a v e   p e r m i s s o n   o n   t h e   s c h e d u l e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - - E n d   D a t e   h a s   t o   b e   g r e a t e r   t h a n   S t a r t   D a t e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 6 ,   @ m s g t e x t   =   N ' T h e   e n d   d a t e   o f   a   s c h e d u l e   m u s t   b e   g r e a t e r   t h a n   t h e   s t a r t   d a t e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   S c h e d u l e   d o e s   n o t   e x i s t ;   i s   i n v a l i d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 7 ,   @ m s g t e x t   =   N ' T h e   S c h e d u l e   i s   i n v a l i d ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   T h e   d a t a   a c c e s s   s e r v i c e   a c c o u n t   m i g h t   n o t   h a v e   t h e   r e q u i r e d   p e r m i s s i o n s    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 0 5 8 ,   @ m s g t e x t   =   N ' T h e   d a t a   a c c e s s   s e r v i c e   a c c o u n t   m i g h t   n o t   h a v e   t h e   r e q u i r e d   p e r m i s s i o n s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   U s e r R o l e   r a n g e :   7 7 7 9 8 - 0 1 0 0   t o   7 7 7 9 8 - 0 1 9 9   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   U s e r R o l e A d m i n i s t r a t o r A l r e a d y E x i s t s E x c e p t i o n  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 1 0 0 ,   @ m s g t e x t   =   N ' A   u s e r   r o l e   w i t h   t h e   a d m i n i s t r a t o r   p r o f i l e   a l r e a d y   e x i s t s .   C a n n o t   c r e a t e   a n o t h e r   u s e r   r o l e   w i t h   t h e   s a m e   p r o f i l e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   U s e r R o l e S y s t e m D e l e t e E x c e p t i o n  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 1 0 1 ,   @ m s g t e x t   =   N ' C a n n o t   d e l e t e   s y s t e m   u s e r   r o l e s . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   U s e r R o l e S y s t e m E x c e p t i o n  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 1 0 2 ,   @ m s g t e x t   =   N ' C a n n o t   c r e a t e   u s e r   r o l e s   w i t h   I s S y s t e m   s p e c i f i e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   N U L L   i s   n o t   a   v a l i d   G r o u p   I d   f o r   t h e   S c o p e   s p e c i f i e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 1 0 3 ,   @ m s g t e x t   =   N ' N U L L   i s   n o t   a   v a l i d   G r o u p I d   f o r   t h e   S c o p e   s p e c i f i e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   N U L L   i s   n o t   a   v a l i d   T y p e I d   f o r   t h e   S c o p e   s p e c i f i e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 1 0 4 ,   @ m s g t e x t   =   N ' N U L L   i s   n o t   a   v a l i d   T y p e I d   f o r   t h e   S c o p e   s p e c i f i e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   O p e r a t i o n a l   D a t a   r a n g e :   7 7 7 9 8 - 0 2 0 0   t o   7 7 7 9 8 - 0 2 9 9   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   I n v a l i d   T i m e s t a m p  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 0 ,   @ m s g t e x t   =   N ' R e q u e s t   t o   u p d a t e   a l e r t   i g n o r e d   d u e   t o   i n v a l i d   T i m e M o d i f i e d ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   I n v a l i d   T i m e s t a m p  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 1 ,   @ m s g t e x t   =   N ' R e q u e s t   t o   u p d a t e   a l e r t   i g n o r e d   d u e   t o   m i s m a t c h   i n   B a s e M a n a g e d E n t i t y I d ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   I n v a l i d   M o n i t o r I d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 2 ,   @ m s g t e x t   =   N ' C a n n o t   c r e a t e   A l e r t .   I n v a l i d   M o n i t o r I d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   I n v a l i d   R u l e I d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 3 ,   @ m s g t e x t   =   N ' C a n n o t   c r e a t e   A l e r t .   I n v a l i d   R u l e I d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   N U L L   c a t e g o r y   i n   M o n i t o r  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 4 ,   @ m s g t e x t   =   N ' C a n n o t   c r e a t e   A l e r t .   M o n i t o r   C a t e g o r y   c a n n o t   b e   N U L L ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   N U L L   c a t e g o r y   i n   R u l e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 5 ,   @ m s g t e x t   =   N ' C a n n o t   c r e a t e   A l e r t .   R u l e   C a t e g o r y   c a n n o t   b e   N U L L . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   T r y i n g   t o   u p d a t e   A l e r t   t h a t   d o e s n ' t   e x i s t   i n   t h e   t a b l e .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 6 ,   @ m s g t e x t   =   N ' N o   a l e r t   m a t c h e s   t h e   g i v e n   A l e r t I d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   A l e r t   r e s o l u t i o n   s t a t e   s h o r t c u t   k e y   h a s   t o   b e   u n i q u e .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 7 ,   @ m s g t e x t   =   N ' A l e r t   r e s o l u t i o n   s t a t e   s h o r t c u t   k e y   h a s   t o   b e   u n i q u e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   A   p r e d e f i n e d   a l e r t   r e s o l u t i o n   s t a t e   c a n   n o t   b e   u p d a t e d .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 8 ,   @ m s g t e x t   =   N ' A   p r e d e f i n e d   a l e r t   r e s o l u t i o n   s t a t e   c a n   n o t   b e   u p d a t e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   O n l y   t h e   a c t i o n   a c c o u n t   s e c u r e   d a t a   t y p e   c a n   b e   a s s o c i a t e d   w i t h   t h e   a c t i o n   a c c o u n t   s e c u r e   r e f e r e n c e .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 0 9 ,   @ m s g t e x t   =   N ' A c t i o n   a c c o u n t   s e c u r e   d a t a   m u s t   b e   p a i r e d   w i t h   t h e   a c t i o n   a c c o u n t   s e c u r e   r e f e r e n c e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   C a n n o t   a s s o c i a t e   a   h e a l t h   s e r v i c e   w i t h   a   c r e d e n t i a l   t h a t   h a s   n o   p a s s w o r d .   T h i s   h a p p e n s   w h e n   t h e   s e c u r e   d a t a   o b j e c t   w a s   i n s e r t e d   b y   a   h e a l t h   s e r v i c e .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 1 0 ,   @ m s g t e x t   =   N ' C a n n o t   a s s o c i a t e   a   h e a l t h   s e r v i c e   w i t h   a   c r e d e n t i a l   t h a t   h a s   n o   p a s s w o r d .   T h i s   h a p p e n s   w h e n   t h e   s e c u r e   d a t a   o b j e c t   w a s   i n s e r t e d   b y   a   h e a l t h   s e r v i c e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   T h e   a s s o c i a t e d   h e a l t h   s e r v i c e   i d   { % s } .   T h i s   c a n   h a p p e n   i f   t h e   h e a l t h   s e r v i c e   h a s   r e c e n t l y   b e e n   d e l e t e d .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 2 1 1 ,   @ m s g t e x t   =   N ' T h e   a s s o c i a t e d   h e a l t h   s e r v i c e   i d   { % s }   d o e s   n o t   e x i s t .   T h i s   c a n   h a p p e n   i f   t h e   h e a l t h   s e r v i c e   h a s   r e c e n t l y   b e e n   d e l e t e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   M a n a g e m e n t P a c k   D a t a   r a n g e :   7 7 7 9 8 - 0 3 0 0   t o   7 7 7 9 8 - 0 3 9 9   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   D u p l i c a t e   N a m e   F o r   M a n a g e d T y p e    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 0 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   M a n a g e d   T y p e   w i t h   t h e   s a m e   n a m e   a s   a n   e x i s t i n g   t y p e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D u p l i c a t e   N a m e   F o r   R e l a t i o n s h i p T y p e    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 1 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   R e l a t i o n s h i p   T y p e   w i t h   t h e   s a m e   n a m e   a s   a n   e x i s t i n g   t y p e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   U p d a t e   s p e c i f i e d ,   b u t   n o   p r i o r   v e r s i o n   o f   M a n a g e m e n t   P a c k   e x i s t s    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 2 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   u p d a t e d   b e c a u s e   i t   h a s   n o t   i n s t a l l e d ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   U p d a t e   s p e c i f i e d ,   b u t   n o   M a n a g e m e n t P a c k   i s   s e a l e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 3 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   u p d a t e d   b e c a u s e   i t   i s   s e a l e d ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -     U p d a t e   s p e c i f i e d ,   b u t     T i m e s t a m p   i s   t o o   o l d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 4 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   u p d a t e d   b e c a u s e   T i m e M o d i f i e d   i s   n o t   t h e   l a t e s t ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -     U p d a t e   s p e c i f i e d ,   b u t     T i m e s t a m p   i s   t o o   o l d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 5 ,   @ m s g t e x t   =   N ' T y p e C a c h e S e l e c t   f a i l e d   d u e   t o   u p d a t e   o f   d a t a   d u r i n g   t r a n s a c t i o n ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -     U p d a t e   s p e c i f i e d ,   b u t     T i m e s t a m p   i s   t o o   o l d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 6 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   u p d a t e d   b e c a u s e   % s   h a s   b e e n   m o d i f i e d   m o r e   r e c e n t l y . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D u p l i c a t e   N a m e   F o r   D i m e n s i o n    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 7 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   D i m e n s i o n   w i t h   t h e   s a m e   n a m e   a s   a n   e x i s t i n g   o u t r i g g e r ,   f a c t ,   o r   d i m e n s i o n :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D u p l i c a t e   N a m e   F o r   F a c t    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 8 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   F a c t   w i t h   t h e   s a m e   n a m e   a s   a n   e x i s t i n g   d i m e n s i o n   o r   f a c t :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D u p l i c a t e   N a m e   F o r   O u t r i g g e r    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 0 9 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   O u t r i g g e r   w i t h   t h e   s a m e   n a m e   a s   a n   e x i s t i n g   o u t r i g g e r   o r   d i m e n s i o n :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D u p l i c a t e   N a m e   F o r   M e a s u r e    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 0 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   M e a s u r e   w i t h   t h e   s a m e   n a m e   a s   a n   e x i s t i n g   m e a s u r e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D u p l i c a t e   N a m e   F o r   M o d u l e    
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 1 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   M o d u l e   w i t h   t h e   s a m e   n a m e   a s   a n   e x i s t i n g   m o d u l e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   C a n ' t   u p g r a d e   M P   b e c a u s e   o f   F u l l T e x t   I n d e x  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 2 ,   @ m s g t e x t   =   N ' C a n n o t   u p g r a d e   M a n a g e m e n t P a c k   b e c a u s e   i t   w o u l d   c h a n g e   a   F u l l   T e x t   I n d e x .     M u s t   u n i n s t a l l   a n d   r e i n s t a l l   n e w   v e r s i o n   t o   m a k e   t h i s   c h a n g e . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D u p l i c a t e   T a r g e t   f o r   D i m e n s i o n   w h e r e   E x t e n d s   i s   n u l l  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 3 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   D i m e n s i o n   t h a t   t a r g e t s   t h e   s a m e   c l a s s   a s   a n   e x i s t i n g   d i m e n s i o n :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
  
 - -   S o u r c e   D i m e n s i o n   f o r   R e l a t i o n s h i p   F a c t   d o e s n ' t   m a t c h   S o u r c e   T y p e   o f   R e l a t i o n s h i p T y p e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 4 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   R e l a t i o n s h i p   F a c t   w i t h   a   m i s m a t c h e d   S o u r c e   D i m e n s i o n   a n d   R e l a t i o n s h i p T y p e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   T a r g e t   D i m e n s i o n   f o r   R e l a t i o n s h i p   F a c t   d o e s n ' t   m a t c h   T a r g e t   T y p e   o f   R e l a t i o n s h i p T y p e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 5 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   R e l a t i o n s h i p   F a c t   w i t h   a   m i s m a t c h e d   T a r g e t   D i m e n s i o n   a n d   R e l a t i o n s h i p T y p e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   N o   S o u r c e   D i m e n s i o n   f o r   R e l a t i o n s h i p   F a c t   a n d   c a n ' t   f i n d   a   m a t c h   f o r   t h i s   R e l a t i o n s h i p T y p e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 6 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   R e l a t i o n s h i p   F a c t   w i t h   n o   d i m e n s i o n   t o   u s e   a s   t h e   S o u r c e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   N o   T a r g e t   D i m e n s i o n   f o r   R e l a t i o n s h i p   F a c t   a n d   c a n ' t   f i n d   a   m a t c h   f o r   t h i s   R e l a t i o n s h i p T y p e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 3 1 7 ,   @ m s g t e x t   =   N ' M a n a g e m e n t P a c k   c a n n o t   b e   i m p o r t e d   b e c a u s e   i t   c o n t a i n s   a   R e l a t i o n s h i p   F a c t   w i t h   n o   d i m e n s i o n   t o   u s e   a s   t h e   T a r g e t :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C o n n e c t o r s   &   M C F   r a n g e :   7 7 7 9 8 - 0 4 0 0   t o   7 7 7 9 8 - 0 4 4 9   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C o n n e c t o r   n o t   i n i t i a l i z e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 0 0 ,   @ m s g t e x t   =   N ' C a n n o t   p e r f o r m   o p e r a t i o n :   C o n n e c t o r   d o e s   n o t   e x i s t   o r   i s   n o t   i n i t i a l i z e d ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   C o n n e c t o r   d o e s   n o t   o w n   o b j e c t  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 0 1 ,   @ m s g t e x t   =   N ' C a n n o t   p e r f o r m   o p e r a t i o n :   C o n n e c t o r   d o e s   n o t   o w n   o b j e c t ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   C o n n e c t o r   i s   a l r e d y   i n   g i v e n   I s I n i t i a l i z e d   s t a t e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 0 2 ,   @ m s g t e x t   =   N ' C o n n e c t o r   i s   a l r e a d y   t h e   g i v e n   I s I n i t i a l i z e d   S t a t e ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   C o n n e c t o r   i s   n o t   u n i t i a l i z e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 0 3 ,   @ m s g t e x t   =   N ' C a n n o t   p e r f o r m   o p e r a t i o n :   C o n n e c t o r   d o e s   n o t   e x i s t   o r   i s   n o t   U n i n i t i a l i z e d ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   C o l l i s i o n   i n   s e t t i n g   t h e   c o n n e c t o r   i d .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 0 4 ,   @ m s g t e x t   =   N ' A   c o l l i s i o n   h a p p e n e d   w h i l e   s e t t i n g   t h e   c o n n e c t o r   i d   o f   a l e r t s . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   A g e n t   a n d   s e r v e r   m a n a g e m e n t :   7 7 7 9 8 - 0 4 5 0   t o   7 7 7 9 8 - 0 4 9 9   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   C o n n e c t o r   n o t   i n i t i a l i z e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 5 0 ,   @ m s g t e x t   =   N ' T h e r e   i s   a n   e x i s t i n g   p e n d i n g   a c t i o n   f o r   a g e n t   % s .   Y o u   m u s t   p r o c e s s   t h i s   p e n d i n g   a c t i o n   b e f o r e   a   n e w   p e n d i n g   a c t i o n   c a n   b e   i n s e r t e d . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   T h e r e   i s   n o   a c t i v e   w o r k f l o w   s e r v e r .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 6 0 ,   @ m s g t e x t   =   N ' T h e r e   c u r r e n t l y   i s   n o   a c t i v e   w o r k f l o w   s e r v e r . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   T h e   c o m p u t e r   d o e s n ' t   e x i s t   o r   i s   a l r e a d y   t h e   a c t i v e   w o r k f l o w   s e r v e r .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 4 6 1 ,   @ m s g t e x t   =   N ' T h e   c o m p u t e r   ' ' % s ' '   e i t h e r   d o e s   n o t   e x i s t   o r   i s   a l r e a d y   t h e   a c t i v e   w o r k f l o w   s e r v e r . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   D e p l o y m e n t :   7 7 7 9 8 - 0 5 0 0   t o   7 7 7 9 8 - 0 5 5 0   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   S e l e c t o r   I d e n t i t y   i s   c h a n g e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 5 0 0 ,   @ m s g t e x t   =   N ' T h e   i n s e r t e d   d a t a   c h a n g e s   t h e   i d e n t i t y   o f   t h e   S e l e c t o r   f o r   t h i s   e n t i t y :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   S e l e c t o r   C o n d i t i o n   i s   n o t   m u t u a l l y   e x c l u s i v e .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 5 0 1 ,   @ m s g t e x t   =   N ' T h e   i n s e r t e d   d a t a   i s   n o t   m u t u a l l y   e x c l u s i v e   t o   o t h e r   s e l e c t o r s   f o r   t h i s   e n t i t y :   % s . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 - -   D e p l o y   I t e m   N o t   F o u n d .  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 8 0 5 0 2 ,   @ m s g t e x t   =   N ' T h e   d e p l o y   i t e m   i s   n o t   p r e s e n t   i n   t h e   c u r r e n t   c o l l e c t i o n :   % s . ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 *  
 *     M a n a g e m e n t   G r o u p   c o n n e c t   /   d i s c o n n e c t   /   p e r m i s s i o n   e r r o r s  
 *  
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 - -   L o g i n   s p e c i f i e d   i n   t h e   M G P r e p a r e C o n n e c t ( )   i s   a l r e a d y   s p e c i f i e d   a s   w r i t e r   l o g i n   f o r   a n o t h e r   m a n a g e m e n t   g r o u p   a n d   t h a t   i s   n o t   c o n f i r m e d   y e t  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 0 0 0 1 ,   @ m s g t e x t   =   N ' L o g i n   s p e c i f i e d   a s   M a n a g e m e n t   G r o u p   W r i t e r   L o g i n   i s   a l r e a d y   s p e c i f i e d   a s   w r i t e r   l o g i n   f o r   a n o t h e r   p e n d i n g   M a n a g e m e n t   G r o u p   c o n n e c t   o p e r a t i o n .   C h o o s e   d i f f e r e n t   l o g i n   o r   c o n f i r m / r e j e c t   p r e v i o u s   c o n n e c t   o p e r a t i o n ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   M G   i s   a l r e a d y   c o n n e c t e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 0 0 0 2 ,   @ m s g t e x t   =   N ' M a n a g e m e n t   G r o u p   i s   a l r e a d y   c o n n e c t e d   t o   t h i s   D a t a   W a r e h o u s e ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   M G   i s   n o t   a n   o w n e r  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 0 0 0 4 ,   @ m s g t e x t   =   N ' O p e r a t i o n   m a y   b e   p e r f o r m e d   o n l y   b y   D a t a   W a r e h o u s e   o w n i n g   M a n a g e m e n t   G r o u p .   T h i s   m a a n g e m e n t   g r o u p   i s   n o t   o w n e r   a n d   m a y   n o t   p e r f o r m   r e q u e s t e d   o p e r a t i o n ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   M G   i s   n o t   p a r t   o f   t h e   D W  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 0 0 0 5 ,   @ m s g t e x t   =   N ' M a n a g e m e n t   g r o u p   w i t h   i d   ' ' % s ' '   i s   n o t   a   m e m b e r   o f   t h i s   D a t a   W a r e h o u s e   o r   y o u   d o   n o t   h a v e   p e r m i s s i o n s   t o   p e r f o r m   a c t i o n s   f o r   t h a t   m a n a g e m e n t   g r o u p ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   C a n n o t   r e j e c t   o w n e r   M G   i f   i t   i s   n o t   t h e   l a s t  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 0 0 0 6 ,   @ m s g t e x t   =   N ' C a n n o t   d e l e t e   o w n i n g   M a n a g e m e n t   G r o u p   f r o m   t h e   D a t a   W a r e h o u s e   w h i l e   o t h e r   m e m b e r   m a n a g e m e n t   g r o u p s   e x i s t .   D e l e t e   m e m b e r   m a n a g e m e n t   g r o u p s   f i r s t ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   M G   i s   n o t   m e m b e r   a t   a l l  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 0 0 0 7 ,   @ m s g t e x t   =   N ' M a n a g e m e n t   G r o u p   w i t h   i d   ' ' % s ' '   i s   n o t   a   m e m b e r   m a n a g e m e n t   g r o u p   o f   t h i s   D a t a   W a r e h o u s e ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   M G   i s   n o t   a l l o w e d   t o   p e r f o r m   a c t i o n s   u n d e r   t h i s   l o g i n  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 0 0 0 8 ,   @ m s g t e x t   =   N ' M a n a g e m e n t   G r o u p   w i t h   i d   ' ' % s ' '   i s   n o t   a l l o w e d   t o   a c c e s s   D a t a   W a r e h o u s e   u n d e r   l o g i n   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 *  
 *     G e n e r i c   d a t a   p r o c e s s i n g   e r r o r  
 *  
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 - -   X m l   p a r s i n g   f a i l e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 0 0 0 ,   @ m s g t e x t   =   N ' F a i l e d   t o   l o a d   a n d   p a r s e   ' ' % s ' '   x m l .   s p _ x m l _ p r e p a r e d o c u m e n t   r e t u r n e d   ' ' % d ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   L o c k   s e t   f a i l e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 0 0 1 ,   @ m s g t e x t   =   N ' F a i l e d   t o   s e t   a p p l i c a t i o n   l o c k   o n   ' ' % s ' ' .   s p _ g e t a p p l o c k   r e t u r n e d   ' ' % d ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   T r y / c a t c h   b l o c k   w r a p p i n g   e r r o r  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 0 0 2 ,   @ m s g t e x t   =   N ' S q l   e x e c u t i o n   f a i l e d .   E r r o r   % d ,   L e v e l   % d ,   S t a t e   % d ,   P r o c e d u r e   % s ,   L i n e   % d ,   M e s s a g e :   % s ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   S t a g i n g   r e n a m e   f a i l e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 0 0 3 ,   @ m s g t e x t   =   N ' F a i l e d   t o   r e n a m e   s t a g i n g   t a b l e   a s   p a r t   o f   d a t a s e t   m a i n t e n a n c e .   s p _ r e n a m e   r e t u r n e d   ' ' % d ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 *  
 *     C u s t o m   i n d e x   c r e a t i o n   e r r o r s  
 *  
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 - -   t a r g e t   t a b l e   c a n n o t   b e   l o c a t e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 0 5 0 ,   @ m s g t e x t   =   N ' C a n n o t   l o c a t e   t a r g e t   t a b l e   f o r   i n d e x i n g .   D a t a s e t   i d   ' ' % s ' ' ,   a g g r e g a t i o n   t y p e   i d   ' ' % d ' ' ,   d e p e n d e n t   t a b l e   i n d i c a t o r   ' ' % d ' ' ,   t a b l e   t a g   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   i n d e x   a l r e a d y   e x i s t s  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 0 5 1 ,   @ m s g t e x t   =   N ' I n d e x   w i t h   u n i q u e   i d   ' ' % s ' '   a l r e a d y   e x i s t s   o n   t a r g e t   t a b l e .   D a t a s e t   i d   ' ' % s ' ' ,   a g g r e g a t i o n   t y p e   i d   ' ' % d ' ' ,   d e p e n d e n t   t a b l e   i n d i c a t o r   ' ' % d ' ' ,   t a b l e   t a g   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 *  
 *     D W   c o m p o n e n t   d e p l o y m e n t   p r o b l e m s  
 *  
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 - -   M P   v e r s i o n   d o e s   n o t   e x i s t  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 1 0 1 ,   @ m s g t e x t   =   N ' D e p l o y m e n t   o p e r a t i o n   v a l i d a t i o n   f a i l e d .   M a n a g e m e n t   p a c k   v e r s i o n   d o e s   n o t   e x i s t .   O p e r a t i o n :   ' ' % s ' ' ;   C o m p o n e n t   t y p e :   ' ' % s ' ' ;   C o m p o n e n t   i d :   ' ' % s ' ' ;   M a n a g e m e n t   p a c k   v e r s i o n :   ' ' % s ' ' ;   T a r g e t :   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   T a r g e t   d b   n o t   f o u n d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 1 0 2 ,   @ m s g t e x t   =   N ' D e p l o y m e n t   o p e r a t i o n   v a l i d a t i o n   f a i l e d .   T a r g e t   d a t a b a s e   o r   d a t a s e t   d o e s   n o t   e x i s t .   O p e r a t i o n :   ' ' % s ' ' ;   C o m p o n e n t   t y p e :   ' ' % s ' ' ;   C o m p o n e n t   i d :   ' ' % s ' ' ;   M a n a g e m e n t   p a c k   v e r s i o n :   ' ' % s ' ' ;   T a r g e t :   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   C o m p o n e n t   n o t   f o u n d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 1 0 3 ,   @ m s g t e x t   =   N ' D e p l o y m e n t   o p e r a t i o n   v a l i d a t i o n   f a i l e d .   C o m p o n e n t   d o e s   n o t   e x i s t .   O p e r a t i o n :   ' ' % s ' ' ;   C o m p o n e n t   t y p e :   ' ' % s ' ' ;   C o m p o n e n t   i d :   ' ' % s ' ' ;   M a n a g e m e n t   p a c k   v e r s i o n :   ' ' % s ' ' ;   T a r g e t :   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   C o m p o n e n t   a l r e a d y   i n s t a l l e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 1 0 4 ,   @ m s g t e x t   =   N ' D e p l o y m e n t   o p e r a t i o n   v a l i d a t i o n   f a i l e d .   C o m p o n e n t   a l r a d y   i n s t a l l e d .   O p e r a t i o n :   ' ' % s ' ' ;   C o m p o n e n t   t y p e :   ' ' % s ' ' ;   C o m p o n e n t   i d :   ' ' % s ' ' ;   M a n a g e m e n t   p a c k   v e r s i o n :   ' ' % s ' ' ;   T a r g e t :   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   C o m p o n e n t   d o e s   n o t   s u p p o r t   u p g r a d e  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 1 0 5 ,   @ m s g t e x t   =   N ' D e p l o y m e n t   o p e r a t i o n   v a l i d a t i o n   f a i l e d .   C o m p o n e n t   d o e s   n o t   s u p p o r t   u p g r a d e   f r o m   p r e v i o u s   v e r s i o n .   O p e r a t i o n :   ' ' % s ' ' ;   C o m p o n e n t   t y p e :   ' ' % s ' ' ;   C o m p o n e n t   i d :   ' ' % s ' ' ;   M a n a g e m e n t   p a c k   v e r s i o n :   ' ' % s ' ' ;   T a r g e t :   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   S c r i p t   t a r g e t   d a t a s e t   d o e s   n o t   m a t c h   o r   d o e s   n o t   e x i s t  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 1 0 6 ,   @ m s g t e x t   =   N ' D e p l o y m e n t   o p e r a t i o n   v a l i d a t i o n   f a i l e d .   D a t a s e t   s c r i p t   t a r g e t   d a t a s e t   t y p e   d o e s   n o t   m a t c h   t h e   t a r g e t   s p e c i f i e d .   O p e r a t i o n :   ' ' % s ' ' ;   C o m p o n e n t   t y p e :   ' ' % s ' ' ;   C o m p o n e n t   i d :   ' ' % s ' ' ;   M a n a g e m e n t   p a c k   v e r s i o n :   ' ' % s ' ' ;   T a r g e t :   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
  
 - -   C o n f i g   p r o v i d e d   b u t   n o t   r e q u i r e d  
 E X E C U T E   s p _ a d d m e s s a g e   @ m s g n u m   =   7 7 7 9 7 1 1 0 7 ,   @ m s g t e x t   =   N ' D e p l o y m e n t   o p e r a t i o n   v a l i d a t i o n   f a i l e d .   C o n f i g u r a t i o n   x m l   p r o v i d e d   f o r   o p e r a t i o n   t h a t   d o e s   n o t   r e q u i r e   c o n f i g u r a t i o n .   O p e r a t i o n :   ' ' % s ' ' ;   C o m p o n e n t   t y p e :   ' ' % s ' ' ;   C o m p o n e n t   i d :   ' ' % s ' ' ;   M a n a g e m e n t   p a c k   v e r s i o n :   ' ' % s ' ' ;   T a r g e t :   ' ' % s ' ' ' ,   @ s e v e r i t y   =   1 6 ,   @ l a n g   =   ' u s _ e n g l i s h ' ,   @ w i t h _ l o g   =   f a l s e ,   @ r e p l a c e   =   ' R E P L A C E '  
 G O  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ S e l e c t F o r T y p e C a c h e '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ S e l e c t F o r T y p e C a c h e  
 G O  
 C R E A T E   p r o c e d u r e   p _ S e l e c t F o r T y p e C a c h e   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ T y p e S p a c e D a t a S e l e c t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ T y p e S p a c e D a t a S e l e c t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ T y p e S p a c e D a t a S e l e c t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h D o m a i n S n a p s h o t L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h D o m a i n S n a p s h o t L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h D o m a i n S n a p s h o t L i s t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h M a i n t e n a n c e M o d e H i s t o r y L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h M a i n t e n a n c e M o d e H i s t o r y L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h M a i n t e n a n c e M o d e H i s t o r y L i s t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h M o n i t o r S t a t e L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h M o n i t o r S t a t e L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h M o n i t o r S t a t e L i s t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h C o n f i g u r a t i o n C h a n g e G e t T y p e '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h C o n f i g u r a t i o n C h a n g e G e t T y p e ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h C o n f i g u r a t i o n C h a n g e G e t T y p e   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h M a n a g e d E n t i t y C h a n g e L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h M a n a g e d E n t i t y C h a n g e L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h M a n a g e d E n t i t y C h a n g e L i s t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h R e l a t i o n s h i p C h a n g e L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h R e l a t i o n s h i p C h a n g e L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h R e l a t i o n s h i p C h a n g e L i s t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h A v a i l a b i l i t y H i s t o r y L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h A v a i l a b i l i t y H i s t o r y L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h A v a i l a b i l i t y H i s t o r y L i s t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ D a t a W a r e h o u s e S y n c h T y p e d M a n a g e d E n t i t y C h a n g e L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ D a t a W a r e h o u s e S y n c h T y p e d M a n a g e d E n t i t y C h a n g e L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ D a t a W a r e h o u s e S y n c h T y p e d M a n a g e d E n t i t y C h a n g e L i s t   A S   R E T U R N   1  
 G O  
  
 I F   E X I S T S   ( S E L E C T   *   F R O M   I N F O R M A T I O N _ S C H E M A . R O U T I N E S   W H E R E   R O U T I N E _ N A M E   =   ' p _ R e p o r t i n g M a n a g e m e n t P a c k L i s t '   A N D   R O U T I N E _ T Y P E   =   ' P R O C E D U R E ' )  
         D R O P   P R O C E D U R E   d b o . p _ R e p o r t i n g M a n a g e m e n t P a c k L i s t ;  
 G O  
 C R E A T E   P R O C E D U R E   p _ R e p o r t i n g M a n a g e m e n t P a c k L i s t   A S   R E T U R N   1  
 G O  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             S D K R o l e . s q l                                                                                                           - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   C r e a t e s   r o l e   f o r   S D K   a c c o u n t   w i t h   a p p r o p r i a t e   p e r m i s s i o n s                 - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -           R o l e   s d k _ u s e r s           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   C r e a t e   t h e   r o l e   i f   i t   d o e s n ' t   e x i s t  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s u s e r s   W H E R E   [ n a m e ]   =   N ' s d k _ u s e r s ' )  
 	 E X E C   s p _ a d d r o l e   N ' s d k _ u s e r s '  
 G O  
  
 - -   A d d   s d k _ u s e r s   t o   d b _ d d l a d m i n   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d d l a d m i n ' ,   N ' s d k _ u s e r s '  
 G O  
  
 - -   A d d   s d k _ u s e r s   t o   d b _ d a t a w r i t e r   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d a t a w r i t e r ' ,   N ' s d k _ u s e r s '  
 G O  
  
 - -   A d d   s d k _ u s e r s   t o   d b _ d a t a r e a d e r   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d a t a r e a d e r ' ,   N ' s d k _ u s e r s '  
 G O  
  
 - -   A d d   s d k _ u s e r s   t o   d b _ s e c u r i t y a d m i n   f i x e d   d a t a b a s e   r o l e .  
 - -   T h i s   a l l o w s   t h e   S D K   t o   G R A N T   R E C E I V E   O N   q u e u e s   i t   c r e a t e s .  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ s e c u r i t y a d m i n ' ,   N ' s d k _ u s e r s '  
 G O  
  
 - -   A d d   s d k _ u s e r s   t o   d b _ a c c e s s a d m i n   f i x e d   d a t a b a s e   r o l e .  
 - -   T h i s   a l l o w s   t h e   S D K   t o   a d d   o r   r e m o v e   a c c e s s   t o   t h e   d a t a b a s e   f o r   o t h e r   u s e r s .  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ a c c e s s a d m i n ' ,   N ' s d k _ u s e r s '  
 G O  
  
 - -   G r a n t i n g   s d k _ u s e r s   p e r m i s s i o n   t o   e x e c u t e   f u n c t i o n s   a n d   s t o r e d   p r o c e d u r e s  
 G R A N T   E X E C U T E   T O   s d k _ u s e r s  
 G O  
  
 - -   G r a n t i n g   s d k _ u s e r s   p e r m i s s i o n   t o   c r e a t e   q u e r y   n o t i f i c a t i o n s  
 G R A N T   S U B S C R I B E   Q U E R Y   N O T I F I C A T I O N S   T O   s d k _ u s e r s  
 G O  
  
 - -   G r a n t i n g   s d k _ u s e r s   R E C E I V E   p e r m i s s i o n   o n   Q u e r y N o t i f i c a t i o n E r r o r s Q u e u e    
 G R A N T   R E C E I V E   O N   Q u e r y N o t i f i c a t i o n E r r o r s Q u e u e   T O   s d k _ u s e r s  
 G O  
  
  
 - -   D a t a b a s e   p e r m i s s i o n s   f o r   u s i n g   S q l D e p e n d e n c y    
 - -   c r e a t e s   a   n e w   r o l e  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s u s e r s   W H E R E   [ n a m e ]   =   N ' s q l _ d e p e n d e n c y _ s u b s c r i b e r ' )  
 E X E C   s p _ a d d r o l e   ' s q l _ d e p e n d e n c y _ s u b s c r i b e r '  
 G O  
  
 - - P e r m i s s i o n s   n e e d e d   f o r   s d k _ u s e r s  
 G R A N T   C R E A T E   P R O C E D U R E   T O   s d k _ u s e r s  
 G O  
  
 G R A N T   C R E A T E   Q U E U E   T O   s d k _ u s e r s  
 G O  
  
 G R A N T   C R E A T E   S E R V I C E   T O   s d k _ u s e r s  
 G O  
  
 G R A N T   R E F E R E N C E S   O N   C O N T R A C T : : [ h t t p : / / s c h e m a s . m i c r o s o f t . c o m / S Q L / N o t i f i c a t i o n s / P o s t Q u e r y N o t i f i c a t i o n ]   T O   s d k _ u s e r s  
 G O  
  
 G R A N T   V I E W   D E F I N I T I O N   T O   s d k _ u s e r s  
 G O  
  
 G R A N T   S E L E C T   t o   s d k _ u s e r s  
 G O  
  
 G R A N T   S U B S C R I B E   Q U E R Y   N O T I F I C A T I O N S   T O   s d k _ u s e r s  
 G O  
  
 G R A N T   R E C E I V E   O N   Q u e r y N o t i f i c a t i o n E r r o r s Q u e u e   T O   s d k _ u s e r s  
 G O  
  
 E X E C   s p _ a d d r o l e m e m b e r   ' s q l _ d e p e n d e n c y _ s u b s c r i b e r ' ,   ' s d k _ u s e r s '  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             D B M o d u l e R o l e . s q l                                                                                                 - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   C r e a t e s   r o l e   f o r   D B   M o d u l e s   a c c o u n t   w i t h   a p p r o p r i a t e   p e r m i s s i o n s   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -           R o l e   d b m o d u l e _ u s e r s           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   C r e a t e   t h e   r o l e   i f   i t   d o e s n ' t   e x i s t  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s u s e r s   W H E R E   [ n a m e ]   =   N ' d b m o d u l e _ u s e r s ' )  
 	 E X E C   s p _ a d d r o l e   N ' d b m o d u l e _ u s e r s '  
 G O  
  
 - -   A d d   d b m o d u l e _ u s e r s   t o   d b _ d a t a w r i t e r   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d a t a w r i t e r ' ,   N ' d b m o d u l e _ u s e r s '  
 G O  
  
 - -   A d d   d b m o d u l e _ u s e r s   t o   d b _ d a t a r e a d e r   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d a t a r e a d e r ' ,   N ' d b m o d u l e _ u s e r s '  
 G O  
  
 - -   A d d   d b m o d u l e _ u s e r s   t o   d b _ d d l a d m i n   f i x e d   d a t a b a s e   r o l e  
 - -   T h i s   i s   r e q u i r e d   t o   a l l o w   d a t a b a s e   m a i n t e n a n c e   m o d u l e s   t o   u p d a t e   t h e   s t a t i s t i c s .  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d d l a d m i n ' ,   N ' d b m o d u l e _ u s e r s '  
 G O  
  
 - -   G r a n t i n g   s d k _ u s e r s   p e r m i s s i o n   t o   e x e c u t e   f u n c t i o n s   a n d   s t o r e d   p r o c e d u r e s  
 G R A N T   E X E C U T E   T O   d b m o d u l e _ u s e r s  
 G O  
  
 - -   G r a n t i n g   d b m o d u l e _ u s e r s   p e r m i s s i o n   t o   e x e c u t e   q u e r i e s   o n   d y n a m i c   m a n a g e m e n t   v i e w s  
 G R A N T   V I E W   D A T A B A S E   S T A T E   T O   d b m o d u l e _ u s e r s  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             P a r t i t i o n R o l e . s q l                                                                                                 - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   C r e a t e s   r o l e   f o r   D B   M o d u l e s   a c c o u n t   w i t h   a p p r o p r i a t e   p e r m i s s i o n s   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   P a r t i t i o n i n g   a n d   G r o o m i n g   p e r m i s s i o n s   - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 G R A N T   A L T E R   O N   d b o . E v e n t I n s e r t V i e w   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a I n s e r t V i e w   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 0 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 1 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 2 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 3 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 4 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 5 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . E v e n t _ 6 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 0 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 1 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 2 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 3 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 4 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 1   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 2   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 3   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 4   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 5   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 6   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 7   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 8   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 5 9   T O   d b m o d u l e _ u s e r s  
 G O  
  
 G R A N T   A L T E R   O N   d b o . P e r f o r m a n c e D a t a _ 6 0   T O   d b m o d u l e _ u s e r s  
 G O  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             C o n f i g S e r v i c e R o l e . s q l                                                                                       - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   C r e a t e s   r o l e   f o r   C o n f i g   S e r v i c e   w i t h   a p p r o p r i a t e   p e r m i s s i o n s           - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -           R o l e   C o n f i g S e r v i c e _ u s e r s     - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   C r e a t e   t h e   r o l e   i f   i t   d o e s n ' t   e x i s t  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s u s e r s   W H E R E   [ n a m e ]   =   N ' c o n f i g s v c _ u s e r s ' )  
 	 E X E C   s p _ a d d r o l e   N ' c o n f i g s v c _ u s e r s '  
 G O  
  
 - -   A d d   c o n f i g s v c _ u s e r s   t o   d b _ d a t a w r i t e r   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d a t a w r i t e r ' ,   N ' c o n f i g s v c _ u s e r s '  
 G O  
  
 - -   A d d   c o n f i g s v c _ u s e r s   t o   d b _ d a t a r e a d e r   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d a t a r e a d e r ' ,   N ' c o n f i g s v c _ u s e r s '  
 G O  
  
 - -   G r a n t i n g   c o n f i g s v c _ u s e r s   p e r m i s s i o n   t o   e x e c u t e   f u n c t i o n s   a n d   s t o r e d   p r o c e d u r e s  
 G R A N T   E X E C U T E   T O   c o n f i g s v c _ u s e r s  
 G O  
  
  
  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -     ( c )   C o p y r i g h t   2 0 0 4 - 2 0 0 6   M i c r o s o f t   C o r p o r a t i o n ,   A l l   R i g h t s   R e s e r v e d                   - -  
 - -     P r o p r i e t a r y   a n d   c o n f i d e n t i a l   t o   M i c r o s o f t   C o r p o r a t i o n                                             - -  
 - -                                                                                                                                                           - -  
 - -     F i l e :             D W R o l e . s q l                                                                                                             - -  
 - -                                                                                                                                                           - -  
 - -     C o n t e n t s :   C r e a t e s   r o l e   f o r   D W   s y n c h   a c c o u n t   w i t h   a p p r o p r i a t e   p e r m i s s i o n s       - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -           R o l e   d w s y n c h _ u s e r s     - -  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 - -   C r e a t e   t h e   r o l e   i f   i t   d o e s n ' t   e x i s t  
 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   s y s u s e r s   W H E R E   [ n a m e ]   =   N ' d w s y n c h _ u s e r s ' )  
 	 E X E C   s p _ a d d r o l e   N ' d w s y n c h _ u s e r s '  
 G O  
  
 - -   A d d   d w s y n c h _ u s e r s   t o   d b _ d a t a r e a d e r   f i x e d   d a t a b a s e   r o l e  
 E X E C   s p _ a d d r o l e m e m b e r   N ' d b _ d a t a r e a d e r ' ,   N ' d w s y n c h _ u s e r s '  
 G O  
  
 G R A N T   E X E C U T E   O N   d b o . p _ S e l e c t F o r T y p e C a c h e   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ T y p e S p a c e D a t a S e l e c t   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h D o m a i n S n a p s h o t L i s t   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h M a i n t e n a n c e M o d e H i s t o r y L i s t   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h M o n i t o r S t a t e L i s t   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h C o n f i g u r a t i o n C h a n g e G e t T y p e   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h M a n a g e d E n t i t y C h a n g e L i s t   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h R e l a t i o n s h i p C h a n g e L i s t   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h A v a i l a b i l i t y H i s t o r y L i s t   T O   d w s y n c h _ u s e r s  
 G R A N T   E X E C U T E   O N   d b o . p _ D a t a W a r e h o u s e S y n c h T y p e d M a n a g e d E n t i t y C h a n g e L i s t   T O   d w s y n c h _ u s e r s  
  
 - -   r e p o r t   d e p l o y m e n t  
 G R A N T   E X E C U T E   O N   d b o . p _ R e p o r t i n g M a n a g e m e n t P a c k L i s t   T O   d w s y n c h _ u s e r s  
 G O  
 
   M S B A M L   `   `   `  ����N  JWpfReportesProyecto, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null9!clr-namespace:WpfReportesProyectoWpfReportesProyecto  5   	   !    WpfReportesProyecto.Filtros   5   	   \ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35n jSAPBusinessObjects.WPF.ViewerShared, Version=13.0.3500.0, Culture=neutral, PublicKeyToken=692fbea5521e1304F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   3local!clr-namespace:WpfReportesProyecto     5   	     � Title$  Filtros��5   	   $��422.796��6   $��589.841��6*   .��5	      � .+�5
   
   �� -   5         ��Name$ 	textBlock��5
      $
��Left=�6'   $��
225,15,0,0q�6B   $
��Wrap=�6V   $��REPORTES��6j   $	��Top=�6z   $
��Bold"�6�   $��16(�6�   $��30��6�   $��93��6�   �� 5   
   -   5        $ 
textBlock1��5      $
��Left=�6(   $��	26,52,0,0q�6C   $
��Wrap=�6V   $��Filtrar por:��6j   $	��Top=�6~   $
��Bold"�6�   $��14(�6�   �� 5   
   -   5         ��Name$ 
boxFiltros��5      $
��Left=�6'   $��	27,81,0,0q�6B   $	��Top=�6U   $	��120��6m   .@�5      �� $��--��6   �� 5      $��Fecha��6   �� 5      $��Tipo de proceso��6   �� 5      $��Tabla��6   �� 5      $��Usuario��6   �� 5      $��Equipo��6   �� 5      $��Todos��6   5      �� 5   
   -   5        $ 
textBlock2��5      $
��Left=�6(   $��
31,133,0,0q�6C   $
��Wrap=�6W   $��Fecha:��6k   $	��Top=�6y   $
��Bold"�6�   $��14(�6�   (  "System.Windows.Controls.DatePicker  5   
   -   5          Name$ txtFecha��5      $
��Left=�6'   $��
31,157,0,0q�6B   $	��Top=�6V   $	��119��6n   �� 5   
   -   5        $ 
textBlock3��5      $
��Left=�6(   $��180,133,0,0q�6C   $
��Wrap=�6X   $��Proceso:��6l   $	��Top=�6|   $
��Bold"�6�   $��14(�6�   �� 5   
   -   5        $ 
boxProceso��5      $
��Left=�6'   $��180,157,0,0q�6B   $	��Top=�6W   $	��120��6o   .@�5      �� $��--��6   �� 5      $��
Inserción��6   �� 5      $��Modificación��6   �� 5      $��Eliminación��6   5      �� 5   
   -   5         ��Name$ 
btnGenerar��5      $��GENERAR REPORTE��6%   $
��Left=�6?   $��336,226,0,0q�6Z   $	��Top=�6o   $	��148��6�   $
��Bold"�6�   $��14(�6�   $��37��6�   6�   �� 5   
   -	   5        $ textBlock3_Copy��5      $
��Left=�6-   $��330,133,0,0q�6H   $
��Wrap=�6]   $��Tabla:��6q   $	��Top=�6   $
��Bold"�6�   $��14(�6�   �� 5    
   -
   5        $ 	boxTablas��5       $
��Left=�6&   $��333,157,0,0q�6A   $	��Top=�6V   $	��120��6n   6z   �� 5!   
   -   5        $ textBlock3_Copy1��5!      $
��Left=�6.   $��
31,215,0,0q�6I   $
��Wrap=�6]   $��Usuario:��6q   $	��Top=�6�   $
��Bold"�6�   $��14(�6�   �� 5"   
   -   5        $ boxUsuarios��5"      $
��Left=�6(   $��
31,243,0,0q�6C   $	��Top=�6W   $	��120��6o   6{   �� 5#   
   -   5        $ textBlock3_Copy2��5#      $
��Left=�6.   $��185,215,0,0q�6I   $
��Wrap=�6^   $��Nombre de equipo:��6r   $	��Top=�6�   $
��Bold"�6�   $��14(�6�   �� 5$   
   -   5         ��Name$ 	txtEquipo��5$      $
��Left=�6%   $��23��6@   $��184,242,0,0q�6L    �� TextWrapping$
 Wrap=�6a   $	��Top=�6u   $	��128��6�   �� 5%   
   -   5        $ button��5%      $��LIMPIAR��6!   $
��Left=�63   $��
34,321,0,0q�6N   $	��Top=�6b   $	��148��6z   $
��Bold"�6�   $��14(�6�   $��37��6�   6�   �� 5&   
   -   5        $ button1��5&      $��SALIR��6"   $
��Left=�62   $��406,326,0,0q�6M   $	��Top=�6b   $	��148��6z   $
��Bold"�6�   $��14(�6�   $��37��6�   6�   5(      5)      
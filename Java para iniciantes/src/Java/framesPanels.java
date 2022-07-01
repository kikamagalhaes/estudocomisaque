package Java;

import java.awt.Panel;

import javax.swing.JFrame;

public class framesPanels {

 public static void main(String[] args) {
  JFrame janela = new JFrame("Meu primeiro frame em Java");
  Panel meuPainel = new Panel();
  
  janela.setDefaultCloseOperation( JFrame.EXIT_ON_CLOSE );
  janela.add(meuPainel);
  janela.setSize(600,400);
  janela.setVisible(true);
 }

}

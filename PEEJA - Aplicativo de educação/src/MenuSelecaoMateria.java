package questionario;


import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


public class MenuSelecaoMateria {
    JPanel painelMateria = new JPanel();
    JFrame Frame = new JFrame();
    JLabel notaMat = new JLabel("");
    JLabel notaPort = new JLabel("");
    JLabel notaHist = new JLabel("");
    JLabel notaCien = new JLabel("");
    JButton btnMatematica = new JButton("Matemática");
    JButton btnPortugues = new JButton("Português");
    JButton btnHistoria = new JButton("História");
    JButton btnCiencias = new JButton("Ciências");
    public String notaMatText = "";

    public MenuSelecaoMateria() {

        //CONFIGURANDO O FRAME DO MENU SELECAO MATERIA
        Frame.add(painelMateria);
        Frame.setSize(1220, 700);

        //CONFIGURANDO A POSIÇÃO DO FRAME PARA O MEIO DA TELA
        Dimension dimensaoTela = Toolkit.getDefaultToolkit().getScreenSize();
        int x = (dimensaoTela.width - Frame.getSize().width) / 2;
        int y = (dimensaoTela.height - Frame.getSize().height) / 2;
        Frame.setLocation(x, y);
        Frame.setDefaultCloseOperation(WindowConstants.EXIT_ON_CLOSE);

        //UTILIZANDO O BOXLAYOUT PARA ORGANIZAR A POSIÇÃO DOS BOTÕES E DOS JLABEL
        painelMateria.setLayout(new BoxLayout(painelMateria, BoxLayout.Y_AXIS));
        painelMateria.setAlignmentX(Component.CENTER_ALIGNMENT);

        //CRIANDO A AÇÃO DO BOTÃO DE MATEMATICA
        btnMatematica.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                Frame.dispose();// TORNAR O FRAME ATUAL INVISIVEL
                new PerguntasMat(btnMatematica, Frame, notaMat).exibirPerguntas(); //EXECUTANDO O METODO DA SUBCLASS PERGUNTASPORT

            }
        });

        //CRIANDO A AÇÃO DO BOTÃO DE PORTUGUÊS
        btnPortugues.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                Frame.dispose();//TORNAR O FRAME ATUAL INVISIVEL
                new PerguntasPort(btnPortugues, Frame, notaPort).exibirPerguntas();//EXECUTANDO O METODO DA SUBCLASS PERGUNTASPORT
            }
        });

        btnHistoria.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                Frame.dispose();//TORNAR O FRAME ATUAL INVISIVEL
                new PerguntasHist(btnHistoria, Frame, notaHist).exibirPerguntas();//EXECUTANDO O METODO DA SUBCLASS PERGUNTASHIST
            }
        });

        btnCiencias.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

                Frame.dispose();//TORNAR O FRAME ATUAL INVISIVEL
                new PerguntasCien(btnCiencias, Frame, notaCien).exibirPerguntas();//EXECUTANDO O METODO DA SUBCLASS PERGUNTASCIEN
            }
        });

        //CRIANDO E CONFIGURANDO O TITULO DO FRAME
        JLabel label_titulo = new JLabel("Qual prova deseja fazer?\n ");
        label_titulo.setAlignmentX(Component.CENTER_ALIGNMENT);
        label_titulo.setBorder(BorderFactory.createEmptyBorder(20, 0, 20, 0));
        painelMateria.add(label_titulo);

        // CRIANDO E ATRIBUINDO O BOTÃO DE MATEMATICA
        btnMatematica.setAlignmentX(Component.CENTER_ALIGNMENT);
        btnMatematica.setMaximumSize(new Dimension(120, 40));
        painelMateria.add(btnMatematica);

        //Configurando a exibição da nota de Matematica
        notaMat.setAlignmentX(Component.CENTER_ALIGNMENT);
        painelMateria.add(notaMat);

        painelMateria.add(Box.createRigidArea(new Dimension(0, 5)));

                                //CRIANDO BOTÕES

        // CRIANDO E ATRIBUINDO O BOTÃO DE PORTUGUÊS
        btnPortugues.setMaximumSize(new Dimension(120, 40)); // Alinha o botão no centro horizontalmente
        btnPortugues.setAlignmentX(Component.CENTER_ALIGNMENT);
        painelMateria.add(btnPortugues);

        //Configurando a exibição da nota de português
        notaPort.setAlignmentX(Component.CENTER_ALIGNMENT);
        painelMateria.add(notaPort);

        painelMateria.add(Box.createRigidArea(new Dimension(0, 5)));

        // CRIANDO E ATRIBUINDO O BOTÃO DE HISTORIA
        btnHistoria.setAlignmentX(Component.CENTER_ALIGNMENT); // Alinha o botão no centro horizontalmente
        btnHistoria.setMaximumSize(new Dimension(120, 40));
        painelMateria.add(btnHistoria);

        //Configurando a exibição da nota de história
        notaHist.setAlignmentX(Component.CENTER_ALIGNMENT);
        painelMateria.add(notaHist);

        painelMateria.add(Box.createRigidArea(new Dimension(0, 5)));

        // CRIANDO E ATRIBUINDO O BOTÃO DE CIENCIAS
        btnCiencias.setAlignmentX(Component.CENTER_ALIGNMENT);// Alinha o botão no centro horizontalmente
        btnCiencias.setMaximumSize(new Dimension(120, 40));
        painelMateria.add(btnCiencias);

        //Configurando a exibição da nota de ciências
        notaCien.setAlignmentX(Component.CENTER_ALIGNMENT);
        painelMateria.add(notaCien);

        //DEFININDO FONTE DO TÍTULO
        Font TituloFont = new Font("Arial", Font.BOLD, 15);
        label_titulo.setFont(TituloFont);

        //DEFININDO FONTE DOS BOTÕES
        Font fonteCheckBox = new Font("Arial", Font.PLAIN, 15);
        btnMatematica.setFont(fonteCheckBox);
        btnPortugues.setFont(fonteCheckBox);
        btnHistoria.setFont(fonteCheckBox);
        btnCiencias.setFont(fonteCheckBox);

    }

    //MÉTODO PARA DEIXAR O FRAME VISIVEL
    public void exibirMenu(){
        Frame.setVisible(true);
    }

    public static void main(String[] args){
        new MenuSelecaoMateria().exibirMenu();
    }

}
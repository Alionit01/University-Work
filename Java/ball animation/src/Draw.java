import javax.swing.*;
import java.awt.*;

class Draw extends JPanel {

    private int ballXPos = 150;
    private int ballYPos = 100;
    private int ballXDir = 5;  // Ball's horizontal speed
    private int ballYDir = 5;  // Ball's vertical speed
    private final int ballSize = 20;

    Draw() {
        setBackground(Color.BLACK);
        Timer timer = new Timer(50, e -> moveBall());  // Timer to move the ball
        timer.start();
    }

    private void moveBall() {
        ballXPos += ballXDir;
        ballYPos += ballYDir;

        // Reverse direction when hitting the borders
        if (ballXPos <= 0 || ballXPos >= getWidth() - ballSize) {
            ballXDir = -ballXDir;
        }
        if (ballYPos <= 0 || ballYPos >= getHeight() - ballSize) {
            ballYDir = -ballYDir;
        }

        repaint();  // Redraw the ball with updated position
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        g.setColor(Color.ORANGE);
        g.fillOval(ballXPos, ballYPos, ballSize, ballSize);
        
    }
}


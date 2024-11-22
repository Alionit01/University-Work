import javax.swing.*;
import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.List;

// Abstract Class for Game Objects
abstract class GameObject {
    protected int x, y, width, height;
    protected Color color;

    public GameObject(int x, int y, int width, int height, Color color) {
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.color = color;
    }

    public abstract void draw(Graphics2D g);
}

// Paddle Class
class Paddle extends GameObject {
    private int moveDistance;

    public Paddle(int x, int y, int width, int height, Color color, int moveDistance) {
        super(x, y, width, height, color);
        this.moveDistance = moveDistance;
    }

    public void moveLeft() {
        x = Math.max(0, x - moveDistance);
    }

    public void moveRight(int boundary) {
        x = Math.min(boundary - width, x + moveDistance);
    }

    @Override
    public void draw(Graphics2D g) {
        g.setColor(color);
        g.fillRect(x, y, width, height);
    }
}

// Ball Class
class Ball extends GameObject {
    private int dirX, dirY;
    private boolean moving;

    public Ball(int x, int y, int size, Color color) {
        super(x, y, size, size, color);
        this.dirX = 0;
        this.dirY = 0;
        this.moving = false; // Ball starts stationary
    }

    public void move(int boundaryWidth, int boundaryHeight, Paddle paddle, BricksManager bricksManager) {
        if (!moving) {
            // Ball stays on the paddle when stationary
            x = paddle.x + paddle.width / 2 - width / 2;
            y = paddle.y - height - 5;
            return;
        }

        x += dirX;
        y += dirY;

        // Boundary Collision
        if (x <= 0 || x >= boundaryWidth - width) dirX = -dirX;
        if (y <= 0) dirY = -dirY;

        // Paddle Collision
        if (new Rectangle(x, y, width, height).intersects(
                new Rectangle(paddle.x, paddle.y, paddle.width, paddle.height))) {
            dirY = -dirY;
        }

        // Brick Collision
        if (bricksManager.checkCollision(x, y, width, height)) {
            dirY = -dirY;
        }
    }

    public void startMoving() {
        if (!moving) {
            moving = true;
            dirX = 5; // Set initial direction
            dirY = -5;
        }
    }

    public void reset() {
        moving = false;
        dirX = 0;
        dirY = 0;
    }

    @Override
    public void draw(Graphics2D g) {
        g.setColor(color);
        g.fillOval(x, y, width, height);
    }
}

// Brick Class
class Brick extends GameObject {
    private boolean visible;

    public Brick(int x, int y, int width, int height, Color color) {
        super(x, y, width, height, color);
        this.visible = true;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    @Override
    public void draw(Graphics2D g) {
        if (visible) {
            g.setColor(color);
            g.fillRect(x, y, width, height);
        }
    }
}

// Manager for Bricks
class BricksManager {
    private final List<Brick> bricks;
    private int score;

    public BricksManager() {
        bricks = new ArrayList<>();
        score = 0;
        initBricks();
    }

    private void initBricks() {
        int rows = 5, cols = 8, brickWidth = 60, brickHeight = 20, padding = 10;
        int startX = (600 - (cols * brickWidth + (cols - 1) * padding)) / 2;
        int startY = 50;

        for (int row = 0; row < rows; row++) {
            for (int col = 0; col < cols; col++) {
                int x = startX + col * (brickWidth + padding);
                int y = startY + row * (brickHeight + padding);
                bricks.add(new Brick(x, y, brickWidth, brickHeight, Color.CYAN));
            }
        }
    }

    public boolean checkCollision(int ballX, int ballY, int ballWidth, int ballHeight) {
        Rectangle ballRect = new Rectangle(ballX, ballY, ballWidth, ballHeight);
        for (Brick brick : bricks) {
            if (brick.isVisible() && ballRect.intersects(new Rectangle(brick.x, brick.y, brick.width, brick.height))) {
                brick.setVisible(false);
                score += 10; // Increment score for hitting a brick
                return true;
            }
        }
        return false;
    }

    public void reset() {
        bricks.clear();
        initBricks();
        score = 0;
    }

    public int getScore() {
        return score;
    }

    public void draw(Graphics2D g) {
        for (Brick brick : bricks) {
            brick.draw(g);
        }
    }

    public boolean allBricksDestroyed() {
        return bricks.stream().noneMatch(Brick::isVisible);
    }
}

// Main Game Panel
class GamePanel extends JPanel {
    private Paddle paddle;
    private Ball ball;
    private BricksManager bricksManager;
    private boolean gameOver;

    public GamePanel() {
        setFocusable(true);

        initializeGame();

        Timer timer = new Timer(30, e -> updateGame());
        timer.start();

        addKeyListener(new KeyAdapter() {
            @Override
            public void keyPressed(KeyEvent e) {
                if (!gameOver) {
                    if (e.getKeyCode() == KeyEvent.VK_A) {
                        paddle.moveLeft();
                    } else if (e.getKeyCode() == KeyEvent.VK_D) {
                        paddle.moveRight(getWidth());
                    } else if (e.getKeyCode() == KeyEvent.VK_SPACE) {
                        ball.startMoving();
                    }
                }
                if (e.getKeyCode() == KeyEvent.VK_R) {
                    initializeGame();
                    repaint();
                }
            }
        });
    }

    private void initializeGame() {
        paddle = new Paddle(250, 470, 90, 20, new Color(210, 180, 140), 10);
        ball = new Ball(280, 420, 18, Color.WHITE);
        bricksManager = new BricksManager();
        gameOver = false;
    }

    private void updateGame() {
        if (!gameOver) {
            ball.move(getWidth(), getHeight(), paddle, bricksManager);

            // Check Game Over Condition
            if (ball.y >= getHeight()) {
                gameOver = true;
            }

            // Check Victory Condition
            if (bricksManager.allBricksDestroyed()) {
                gameOver = true;
            }
        }
        repaint();
    }

    @Override
    protected void paintComponent(Graphics g) {
        super.paintComponent(g);
        Graphics2D g2d = (Graphics2D) g;

        // Draw Game Objects
        paddle.draw(g2d);
        ball.draw(g2d);
        bricksManager.draw(g2d);

        // Draw Score
        g2d.setColor(Color.WHITE);
        g2d.setFont(new Font("Arial", Font.BOLD, 16));
        g2d.drawString("Score: " + bricksManager.getScore(), 10, 20);

        // Game Over Message
        if (gameOver) {
            g2d.setColor(Color.RED);
            g2d.setFont(new Font("Arial", Font.BOLD, 32));
            g2d.drawString("Game Over!", getWidth() / 2 - 100, getHeight() / 2);

            g2d.setFont(new Font("Arial", Font.PLAIN, 16));
            g2d.drawString("Press 'R' to Restart", getWidth() / 2 - 80, getHeight() / 2 + 40);
        }
    }
}

// Main Class
public class BrickBreakerGame {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Brick Breaker");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(600, 550);
        frame.setLocationRelativeTo(null);

        GamePanel gamePanel = new GamePanel();
        gamePanel.setBackground(Color.BLACK);
        frame.add(gamePanel);

        frame.setVisible(true);
    }
}

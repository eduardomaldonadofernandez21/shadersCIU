PShader shader;
float speed;
float color_intensity;

void setup() {
  size(800, 800, P2D);
  speed = 1.0;
  textAlign(CENTER, CENTER);
  shader = loadShader("shaderRotate.glsl");
}

void draw() {
  noStroke();
  shader.set("u_resolution", float(width), float(height));
  shader.set("u_time", millis() / 1000.0);
  shader.set("u_fluid_speed", speed);
  shader(shader);
  rect(0, 0, width, height);
}

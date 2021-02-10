int numCentroids = 3;
Point[] centroids;
int numPoints;
Point[] points;
PImage img;

void setup() {
  size(828, 693);
  img = loadImage("IMG-0051 (1).jpg");
  centroids = new Point[numCentroids];
  numPoints = img.pixels.length;
  points = new Point[numPoints];
  noStroke();

  //initializing
  for (int i = 0; i < points.length; i++) {
    points[i] = new Point(new PVector(i%img.width, i/img.width), img.pixels[i]);
  }  
  color randomColor = color(random(50, 240), random(50, 240), random(50, 240));
  for (int i = 0; i < centroids.length; i++) {
    centroids[i] = new Point(new PVector(0, 0), mixRandomColors(randomColor));
  }
}

void draw() {
  clear();  
  image(img, 0, 0);
  
  for (Point point : points) { //running each point
    point.updateMyCentroid();
    point.display();
  }
  
  for (int i = 0; i < centroids.length; i++) { //relocating centroid
    float rAvg = red(points[0].currentColor);
    float gAvg = green(points[0].currentColor);
    float bAvg = blue(points[0].currentColor);
    int n = 1;
    for (int j = 1; j < points.length; j++) {
      if (points[j].myCentroidIndex == i) {
        rAvg = (red(points[j].currentColor) + (n-1)*rAvg)/n;
        gAvg = (green(points[j].currentColor) + (n-1)*gAvg)/n;
        bAvg = (blue(points[j].currentColor) + (n-1)*bAvg)/n;
        n++;
      }
    }
    centroids[i].currentColor = color(rAvg, gAvg, bAvg);
  }
}

color mixRandomColors(color colorMixer) { //attempt to create aesthetically pleasing color palette
  float rNew = random(255);
  float gNew = random(255);
  float bNew = random(255);
  
  return color((rNew+red(colorMixer))/2, (gNew+green(colorMixer))/2, (bNew+blue(colorMixer))/2);
}

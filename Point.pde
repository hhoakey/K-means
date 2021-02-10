class Point {
  PVector pos;
  int myCentroidIndex;
  color currentColor, initialColor;

  Point(PVector posTemp, color colorTemp) {
    pos = posTemp;
    currentColor = colorTemp;
    initialColor = colorTemp;
  }
  
  void updateMyCentroid() { //finding closest centroid
    float r1 = red(currentColor);
    float g1 = green(currentColor);
    float b1 = blue(currentColor);
    
    float minDist = r1*r1 + g1*g1 + b1*b1;
    
    for (int j = 0; j < centroids.length; j++) {
      float r2 = red(centroids[j].currentColor);
      float g2 = green(centroids[j].currentColor);
      float b2 = blue(centroids[j].currentColor);
      float thisDist = (r1-r2)*(r1-r2) + (g1-g2)*(g1-g2) + (b1-b2)*(b1-b2);
      if (thisDist < minDist) {
        minDist = thisDist;
        myCentroidIndex = j;
      }
    }    
  }

  void display() { //display point with the initial color of its centroid
    set((int) pos.x, (int) pos.y, centroids[myCentroidIndex].initialColor);
  }
}

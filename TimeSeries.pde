String data[], chunks[], date[];
int time[], year[], month[], day[];
float aus[], brit[], can[], dut[], fren[], german[], jpn[], swiss[];

class TimeSeries {    //store all the data read from the csv file
  
  //contructor
  TimeSeries( String file) {
    data = loadStrings( file );
    date = new String[data.length-3];

    year = new int[data.length-3];
    month = new int[data.length-3];
    day = new int[data.length-3];

    aus = new float[data.length-3];
    brit = new float[data.length-3];
    can = new float[data.length-3];
    dut = new float[data.length-3];
    fren = new float[data.length-3];
    german = new float[data.length-3];
    jpn = new float[data.length-3];
    swiss = new float[data.length-3];
    
    //splitting the values
    for (int i=1; i< data.length-2; i++) {
      chunks = split(data[i], ",");
      date[i-1] = chunks[0];
      aus[i-1] = float(chunks[1]);
      brit[i-1] = float(chunks[2]);
      can[i-1] = float(chunks[3]);
      dut[i-1] = float(chunks[4]);
      fren[i-1] = float(chunks[5]);
      german[i-1] = float(chunks[6]);
      jpn[i-1] = float(chunks[7]);
      swiss[i-1] = float(chunks[8]);
    }
  }
  
  //function to draw the lines on the graph
  void plotLine(float x, float y, float nextX, float nextY, color p_color) {
    strokeWeight(1);
    stroke(p_color);
    if ( (x >= 75 && x <= 875) && (y >= 50 && y <= height-50) && (nextX >= 75 && nextX <= 875) && (nextY >= 50 && nextY <= height-50)) line(x, y, nextX, nextY);
  }

  //convert all the time to day format
  void convertTime() {
    int max_time, min_time;
    String[] tempChunk;
    for (int i=0; i<date.length; i++) {
      tempChunk = split(date[i], "-");
      year[i] = int(tempChunk[0]);
      month[i] = int(tempChunk[1]);
      day[i] = int(tempChunk[2]);
    }
    max_time = (year[year.length-1]*365) + (month[month.length-1]*30) + day[day.length-1];
    min_time = (year[0]*365) + (month[0]*30) + day[0];
    time = new int[year.length];

    for (int i=0; i<year.length; i++) {
      time[i] =  max_time - ((year[i]*365) + (month[i]*30) + day[i]);
    }
    time = sort(time);
    println(max_time-min_time);
  }
  
  //a set of getter methods
  int getTime(int index) {
    return time[index];
  }

  String getMaxDate() {
    return date[date.length-1];
  }

  String getMinDate() {
    return date[0];
  }

  float getAus(int index) {
    return aus[index];
  }

  float getBrit(int index) {
    return brit[index];
  }

  float getCan(int index) {
    return can[index];
  }

  float getDut(int index) {
    return dut[index];
  }

  float getFren(int index) {
    return fren[index];
  }

  float getGerman(int index) {
    return german[index];
  }

  float getJpn(int index) {
    return jpn[index];
  }

  float getSwiss(int index) {
    return swiss[index];
  }

  int getLength(float[] obj) {
    return obj.length;
  }
}


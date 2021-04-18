#This file is owned by Ankit Hinge

import cv2

def speed(trk):
    global tracker
    tracker = max(1,trk)

def position(pos):
    global video
    video.set(cv2.CAP_PROP_POS_FRAMES, pos)

video = cv2.VideoCapture("campus.mp4")
cv2.namedWindow("Video player")

tracker = 50
cv2.createTrackbar("Speed", "Video player", 50, 100, speed)

videolen = int(video.get(cv2.CAP_PROP_FRAME_COUNT))
cv2.createTrackbar("Position", "Video player", 0, videolen, position)

while (True) :
    ret,frame = video.read()

    if ret == True:
        cv2.imshow("Video player", frame)
        cv2.setTrackbarPos("Position","Video player", int(video.get(cv2.CAP_PROP_POS_FRAMES)))

    else:
        break

    key = cv2.waitKey(tracker)

    if key == ord('q'):
        break
    if key == ord(' '):     # Use 'space bar' to play and pause video.
        cv2.waitKey(-1)

video.release()
cv2.destroyAllWindows()





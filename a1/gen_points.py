# Generator Program

# Imports
import sys
import argparse
import random
import math

# Error Handling for Command Line 
def check_if_digit_n(n, mindist):
    if not 0 < int(n):
        print("N less than zero", file=sys.stderr)
        sys.exit(-1)
    
    if not 0 < int(mindist) < 10:
        print("mindist outside range", file=sys.stderr)
        sys.exit(-2)
    
    if int(n) > (10000 / (math.pi * (int(mindist))**2)):
        print("point saturation", file=sys.stderr)
        sys.exit(-3)
    
    return 0

# Euclidean Distance Formula
def euclidean_distance(x1, x2):
    return math.sqrt((x1[0] - x2[0]) ** 2 + (x1[1] - x2[1]) ** 2)
    
# Random Point Generator
def random_point_generator(n, mindist, coordinate):
    coordinate_list = []
    i = 1
    while i <= int(n):
        x_coordinate = round(random.uniform(-50, 50), 2)
        y_coordinate = round(random.uniform(-50, 50), 2)
        new_coordinate = (x_coordinate, y_coordinate)
        if all(euclidean_distance(new_coordinate, exisiting_point) >= mindist for exisiting_point in coordinate):
            coordinate_list.append(new_coordinate)
            coordinate.append(new_coordinate)
            print(f"{x_coordinate}, {y_coordinate}")
        i += 1
    return coordinate_list

def main():
    # Command Line Parameters
    parser = argparse.ArgumentParser(description="Point Generation Parameters")
    parser.add_argument('-mindist', type=int, help="Must be an integer")
    parser.add_argument('-N', type=int, help="Must be an integer")
    parser.add_argument('-rseed', type=int, help="Random number generator seed")
    args = parser.parse_args()

    # Checking for Errors
    if check_if_digit_n(args.N, args.mindist) != 0:
        sys.exit()

    # Random Seed Generation
    random.seed(args.rseed)

    # Coordinate Generation
    coordinate = []
    coordinates = random_point_generator(args.N, args.mindist, coordinate)

if __name__ == '__main__':
    main()





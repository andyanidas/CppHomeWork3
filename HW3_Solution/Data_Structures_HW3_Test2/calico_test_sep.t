- init:
    run: rm -f hw3
    blocker: true

- build:
    run: g++ -std=c++11 -Wall -Werror main.cpp -o hw3                                  # timeout: 8
    blocker: true


- case1:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1[ \r\n]*"                                     # timeout: 2 
        - expect: "[ \r\n]*Message:message1 To:0 1 mh_1[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case2:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 [ \r\n]*"                                  # timeout: 2
        - expect: "[ \r\n]*Message:message2 To:0 2 mh_2[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case3:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 [ \r\n]*"                                # timeout: 2
        - expect: "[ \r\n]*Message:message3 To:0 3 mh_3[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case4:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 [ \r\n]*"                              # timeout: 2
        - expect: "[ \r\n]*Message:message4 To:0 4 mh_4[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case5:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 [ \r\n]*"                            # timeout: 2
        - expect: "[ \r\n]*Message:message5 To:0 5 mh_5[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case6:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 6 [ \r\n]*"                          # timeout: 2
        - expect: "[ \r\n]*Message:message6 To:0 6 mh_6[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case7:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 6 7 [ \r\n]*"                        # timeout: 2
        - expect: "[ \r\n]*Message:message7 To:0 7 mh_7[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case8:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 10
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 6 7 8 [ \r\n]*"                      # timeout: 2
        - expect: "[ \r\n]*Message:message8 To:0 8 mh_8[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case9:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 5
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 6 7 8 9 [ \r\n]*"                    # timeout: 2
        - expect: "[ \r\n]*Message:message9 To:0 9 mh_9[ \r\n]*"                       # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case10:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 5
    script:
        - expect: "[ \r\n]*Can not be reached the mobile host mh_10 at the moment[ \r\n]*"     # timeout: 2
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 6 7 8 9 10 11 12[ \r\n]*"                    # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case11:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 5
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 6 7 8 9 10 11 12[ \r\n]*"                    # timeout: 2
        - expect: "[ \r\n]*Can not be reached the mobile host mh_11 at the moment[ \r\n]*"     # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0

- case12:
    run: ./hw3 ../../Data_Structures_HW3_Test2/Network.txt ../../Data_Structures_HW3_Test2/Messages.txt
    points: 5
    script:
        - expect: "[ \r\n]*Traversing:0 1 2 3 4 5 6 7 8 9 10 11 12[ \r\n]*"                    # timeout: 2
        - expect: "[ \r\n]*Can not be reached the mobile host mh_12 at the moment[ \r\n]*"     # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0


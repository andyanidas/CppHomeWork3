- init:
    run: rm -f hw3
    blocker: true

- build:
    run: g++ -std=c++11 -Wall -Werror main.cpp -o hw3                                                          # timeout: 8
    blocker: true


- case1:
    run: ./hw3 ../../Data_Structures_HW3_Test1/Network.txt ../../Data_Structures_HW3_Test1/Messages.txt
    points: 100
    script:
        - expect: "[ \r\n]*Traversing:0 5[ \r\n]*"                                                             # timeout: 2
        - expect: "[ \r\n]*Message:this is a message To:0 5 mh_13[ \r\n]*"                                     # timeout: 2
        - expect: "[ \r\n]*Traversing:0 5 2 7 9 12 6 16 3[ \r\n]*"                                             # timeout: 2
        - expect: "[ \r\n]*Message:this is another message To:0 3 mh_8[ \r\n]*"                                # timeout: 2
        - expect: "[ \r\n]*Traversing:0 5 2 7 9[ \r\n]*"                                                       # timeout: 2
        - expect: "[ \r\n]*Message:message3 To:0 9 mh_26[ \r\n]*"                                              # timeout: 2
        - expect: "[ \r\n]*Traversing:0 5 2 7 9 12 6 16 3[ \r\n]*"                                             # timeout: 2
        - expect: "[ \r\n]*Can not be reached the mobile host mh_500 at the moment[ \r\n]*"                    # timeout: 2
        - expect: "[ \r\n]*Traversing:0 5 2 7[ \r\n]*"                                                         # timeout: 2
        - expect: "[ \r\n]*Message:message5 To:0 5 7 mh_27[ \r\n]*"                                            # timeout: 2
        - expect: "[ \r\n]*Traversing:0 5 2 7 9 12 6[ \r\n]*"                                                  # timeout: 2
        - expect: "[ \r\n]*Message:message6 To:0 12 6 mh_6[ \r\n]*"                                            # timeout: 2
        - expect: "[ \r\n]*Traversing:0 5 2 7 9 12 6 16[ \r\n]*"                                                  # timeout: 2
        - expect: "[ \r\n]*Message:message7 To:0 12 6 16 mh_7[ \r\n]*"                                            # timeout: 2
        - expect: _EOF_ # timeout: 2
    return: 0




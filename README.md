# 알고리즘스터디를 진행하면서 모르고 있던 내용들
이것이 취업을 위한 코딩 테스트다 with 파이썬 책을 참고했습니다.
> [!NOTE] 시간 복잡도
> 간단하게 2중 반복 문을 사용하면 시간복잡도는 O(n^2) 의 시간복잡도를 가진다. 하지만 모든 2중 반복 문은 시간복잡도가 O(n^2) 은 아니다. 
> 일반적인 코딩 테스트에서는 상수를 고려해야 하는 경우는 적지만, 빅오 표기법이 항상 절대적이진 않다.  

|          | N이 1,000 일 때의 연산 횟수 |
| -------- | ------------------- |
| O(N)     | 1,000               |
| O(NlogN) | 10,000              |
| O(N^2)   | 100,000             |
| O(N^3)   | 1,000,000           |
모두 시간 제한이 1초인 문제에 대한 예시
-  N의 범위가 500인 경우 : 시간 복잡도 O(N^3) 인 알고리즘을 설계
-  N의 범위가 2,000인 경우 : 시간 복잡도 O(N^2) 인 알고리즘을 설계
-  N의 범위가 100,000인 경우 : 시간 복잡도 O(NlogN) 인 알고리즘을 설계
-  N의 범위가 10,000,000인 경우 : 시간 복잡도 O(N) 인 알고리즘을 설계 

[프로그래머스 코딩테스트 정답률 높은 문제 순](https://school.programmers.co.kr/learn/challenges?order=acceptance_desc&levels=1%2C2&languages=swift)


.isNumber

.filter | String(n, radix: 2)

.ceil(), replacingOccurrences()

.isLetter

.indices



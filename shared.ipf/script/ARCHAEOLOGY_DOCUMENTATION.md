# 고고학 시스템 문서

이 문서는 고고학 시스템 관련 두 개의 공유 스크립트 파일을 정리한 것입니다.

## 목차
1. [shared_archeology.lua](#shared_archeologylua)
2. [shared_archeology_simple.lua](#shared_archeology_simplelua)

---

## shared_archeology.lua

고고학 시스템의 핵심 공유 스크립트로, 맵 관리, 보상 시스템, 몬스터 등장 로직을 담당합니다.

### 주요 구성 요소

#### 1. 전역 변수 및 상수

```lua
shared_archeology = {}
local _archeology_map_list = nil
local _archeology_region_list = nil
local _archeology_reward_list = nil  -- { lv : list }
local _archeology_region_reward_list = nil  -- { region : list }
max_archeology_map_count = 3
max_archeology_point = 3
local _max_archeology_try_count = 50
```

- **최대 맵 수**: 3개
- **최대 포인트**: 3개
- **최대 시도 횟수**: 50회

#### 2. 데이터 초기화 함수

**`make_archeology_map_list()`**
- `archeology_map_list` 클래스에서 맵 목록과 지역 정보를 로드
- `archeology_reward_list` 클래스에서 레벨별 보상 목록을 로드
- 초기화는 스크립트 로드 시 자동 실행됨

#### 3. 공개 함수

##### 맵/지역 정보 조회

- **`get_archeology_map_list()`**: 전체 맵 목록 반환
- **`get_archeology_region_list()`**: 지역별 맵 목록 반환
- **`get_max_archeology_try_count()`**: 최대 시도 횟수 반환

##### 비용 및 보상

**`get_cost(lv)`**
- 레벨에 따른 임무 비용 반환
- 레벨 470: `Vibora_misc_Lv2` 5개
- 레벨 530: `Vibora_misc_Lv2` 10개

**`get_reward_list(lv)`**
- 특정 레벨의 보상 목록 반환

##### Weight 기반 보상 선택

**`get_weighted_reward(lv, region, rare_chance, normal_chance)`**

- **매개변수**:
  - `lv`: 레벨
  - `region`: 지역 ("All", "Klaipeda", "Orsha", "Fedimian")
  - `rare_chance`: 희귀 아이템 확률 보너스 (%)
  - `normal_chance`: 일반 아이템 확률 보너스 (%)
  
- **동작**:
  1. 레벨과 지역에 맞는 보상 풀 구성
  2. Weight 기반 랜덤 선택
  3. 희귀도에 따른 가중치 보정 적용
  4. 선택된 아이템의 ClassName과 개수 반환

- **반환값**: `class_name, count` 또는 `nil`

##### 몬스터 등장 확률 체크

**`check_monster_spawn(region, pc)`**

- **매개변수**:
  - `region`: 지역명
  - `pc`: 플레이어 객체 (ExProp 보너스 적용)
  
- **기본 확률**: 15%
- **지역별 보너스**:
  - Fedimian: 20%
  - Klaipeda: 18%
- **ExProp 보너스**: `ARCHEOLOGY_MONSTER_SPAWN_RATE` (최대 50%)
  
- **반환값**: `true` (등장) / `false` (미등장)

##### 몬스터 타입 결정

**`get_monster_type(pc)`**

- **매개변수**:
  - `pc`: 플레이어 객체 (ExProp 보너스 적용)
  
- **기본 확률**:
  - Normal: 기본
  - Elite: 3% (ExProp 보너스 최대 25%)
  - Boss: 1%
  
- **ExProp 보너스**: `ARCHEOLOGY_ELITE_SPAWN_RATE`
  
- **반환값**: `"Normal"`, `"Elite"`, 또는 `"Boss"`

---

## shared_archeology_simple.lua

간단한 고고학 옵션 시스템으로, ClassID와 수치를 기반으로 한 옵션 관리 기능을 제공합니다.

### 주요 기능

#### 1. 옵션 롤링 함수

**`ROLL_RANDOM_ARCHEOLOGY_OPTION(option_pool_ids, option_count)`**

옵션 풀에서 중복 없이 N개의 옵션을 Weight 기반으로 랜덤 선택하고 수치를 롤링합니다.

- **매개변수**:
  - `option_pool_ids`: 세미콜론으로 구분된 옵션 ID 문자열 (예: `"1;2;3"`)
  - `option_count`: 선택할 옵션 개수 (기본값: 1)
  
- **동작**:
  1. 옵션 ID 파싱
  2. `archeology_option_list` 클래스에서 옵션 정보 로드
  3. Weight 기반 랜덤 선택 (중복 없음)
  4. 각 옵션의 MinValue ~ MaxValue 범위에서 수치 롤링
  
- **반환값**: `{ {option_cls_id, rolled_value}, {option_cls_id, rolled_value}, ... }`

#### 2. 옵션 직렬화 함수

**`SERIALIZE_ARCHEOLOGY_OPTION(option_cls_id_or_list, value)`**

옵션 정보를 문자열로 직렬화합니다. 단일 옵션과 다중 옵션을 모두 지원합니다.

- **단일 옵션 형식**: `"{option_cls_id};{value}"`
  - 예: `"1;3"` = ClassID 1번 옵션, 수치 3
  
- **다중 옵션 형식**: `"{id1};{val1},{id2};{val2},{id3};{val3}"`
  - 예: `"1;3,5;10,7;15"` = 3개 옵션
  
- **매개변수**:
  - `option_cls_id_or_list`: 숫자(단일) 또는 테이블(다중) `{ {id1, val1}, {id2, val2}, ... }`
  - `value`: 단일 옵션일 경우 수치 값
  
- **반환값**: 직렬화된 문자열 또는 `"None"`

#### 3. 옵션 역직렬화 함수

**`DESERIALIZE_ARCHEOLOGY_OPTION(arc_prefix)`**

직렬화된 옵션 문자열을 파싱하여 테이블로 변환합니다.

- **매개변수**:
  - `arc_prefix`: 직렬화된 옵션 문자열
  
- **반환값**: `{ {option_cls_id, value}, {option_cls_id, value}, ... }`

#### 4. 옵션 정보 조회 함수

**`GET_ARCHEOLOGY_OPTION_INFO(arc_prefix)`**

직렬화된 옵션 문자열에서 상세 정보를 추출합니다.

- **매개변수**:
  - `arc_prefix`: 직렬화된 옵션 문자열
  
- **반환값**: `{ {tag, value, desc, grade}, {tag, value, desc, grade}, ... }`
  - `tag`: 옵션 태그 (Stat 속성)
  - `value`: 옵션 수치
  - `desc`: 옵션 설명
  - `grade`: 옵션 등급

#### 5. 내부 함수

**`calc_weight_base_random(pools, pickcount)`**

Weight 기반 랜덤 선택 알고리즘을 구현합니다.

- **알고리즘**:
  1. 각 옵션에 대해 `U = random(0, 1)`, `V = U^(1/Weight)` 계산
  2. V 값 기준으로 내림차순 정렬
  3. 상위 N개 선택
  4. 각 옵션의 MinValue ~ MaxValue 범위에서 수치 롤링
  
- **정수/실수 처리**:
  - MinValue와 MaxValue가 정수면 `IMCRandom` 사용
  - 실수면 `IMCRandomFloat` 사용

**`isInteger(n)`**

숫자가 정수인지 확인하는 헬퍼 함수입니다.

---

## 사용 예시

### shared_archeology.lua 사용 예시

```lua
-- 맵 목록 가져오기
local map_list = shared_archeology.get_archeology_map_list()

-- 레벨 470 임무 비용 확인
local item_name, count = shared_archeology.get_cost(470)
-- 반환: 'Vibora_misc_Lv2', 5

-- Weight 기반 보상 선택
local reward_name, reward_count = shared_archeology.get_weighted_reward(470, "Klaipeda", 10, 5)

-- 몬스터 등장 여부 확인
local will_spawn = shared_archeology.check_monster_spawn("Fedimian", pc)

-- 몬스터 타입 결정
local monster_type = shared_archeology.get_monster_type(pc)
-- 반환: "Normal", "Elite", 또는 "Boss"
```

### shared_archeology_simple.lua 사용 예시

```lua
-- 옵션 롤링 (3개 선택)
local options = ROLL_RANDOM_ARCHEOLOGY_OPTION("1;2;3;4;5", 3)
-- 반환: { {1, 5}, {3, 10}, {5, 7} }

-- 옵션 직렬화 (단일)
local serialized = SERIALIZE_ARCHEOLOGY_OPTION(1, 5)
-- 반환: "1;5"

-- 옵션 직렬화 (다중)
local serialized_multi = SERIALIZE_ARCHEOLOGY_OPTION({{1, 5}, {3, 10}, {7, 15}})
-- 반환: "1;5,3;10,7;15"

-- 옵션 역직렬화
local deserialized = DESERIALIZE_ARCHEOLOGY_OPTION("1;5,3;10,7;15")
-- 반환: { {1, 5}, {3, 10}, {7, 15} }

-- 옵션 정보 조회
local info = GET_ARCHEOLOGY_OPTION_INFO("1;5,3;10")
-- 반환: { 
--   {tag = "STR", value = 5, desc = "힘 증가", grade = 1},
--   {tag = "INT", value = 10, desc = "지능 증가", grade = 2}
-- }
```

---

## 데이터 구조

### archeology_map_list
- `ClassName`: 맵 이름
- `Region`: 지역명

### archeology_reward_list
- `ClassName`: 아이템 클래스명
- `Lv`: 레벨
- `Region`: 지역 ("All", "Klaipeda", "Orsha", "Fedimian")
- `Weight`: 가중치
- `Rarity`: 희귀도 ("Normal", 기타)
- `MinCount`: 최소 개수
- `MaxCount`: 최대 개수

### archeology_option_list

**파일 위치**: `/ktos_unpack/ies.ipf/archeology_option_list.ies`

**로드 방식**: 게임 엔진의 `GetClassByType('archeology_option_list', id)` 함수를 통해 로드됩니다.

**데이터 구조**:
- `ClassID`: 옵션 ID (1~52)
- `Grade`: 등급 (1=Low, 2=Mid, 3=High)
- `Weight`: 가중치 (롤링 확률에 영향)
- `MinValue`: 최소 수치
- `MaxValue`: 최대 수치
- `ClassName`: 옵션 클래스명
- `Type`: 타입 ("Effect" 또는 "Stat")
- `Stat`: 옵션 태그 (ExProp 속성명)
- `Desc`: 설명

**옵션 목록** (총 52개):

| ID | 등급 | 옵션명 | 타입 | 설명 | 수치 범위 |
|---|---|---|---|---|---|
| 1-3 | 1-3 | COIN_GAIN | Effect | 일반 유물 추가 획득 확률 | 1-3 / 3-7 / 7-12 |
| 4-6 | 1-3 | DETECT_RANGE | Effect | 탐지기 유효 범위 증가 | 10-30 / 30-70 / 70-120 |
| 7-9 | 1-3 | RARE_FIND | Effect | 발굴 시 희귀 유물 발견 확률 증가 (%) | 3-7 / 7-15 / 15-25 |
| 10-12 | 1-3 | QUALITY_UP | Effect | 몬스터 처치 시 유물 상태 등급 향상 확률 (%) | 5-10 / 10-20 / 20-35 |
| 13-15 | 1-3 | EXP_BONUS | Effect | 고대인의 유실물 수량 증가률 (%) | 5-10 / 10-20 / 20-40 |
| 16-18 | 1-3 | CRITICAL_DIG | Effect | 크리티컬 발굴 확률 - 보상 2배 (%) | 1-2 / 2-3 / 3-5 |
| 19-21 | 1-3 | DIG_COUNT | Effect | 몬스터 발견 확률 증가 | 1-2 / 2-4 / 4-6 |
| 22-24 | 1-3 | DOUBLE_DROP | Effect | 처치 시 추가 유물 동시 획득 확률 (%) | 5-10 / 10-20 / 20-35 |
| 25-27 | 1-3 | HP_BONUS | Stat | 최대 HP 증가 | 5000-10000 / 10000-15000 / 15000-20000 |
| 28-30 | 1-3 | DEF_BONUS | Stat | 물리 방어력 증가 | 500-2000 / 2000-3000 / 3000-4000 |
| 31-33 | 1-3 | MDEF_BONUS | Stat | 마법 방어력 증가 | 500-2000 / 2000-3000 / 3000-4000 |
| 34-36 | 1-3 | MON_DROP_RATE | Effect | 고고학 몬스터 처치 시 아이템 드롭률 증가 (%) | 0.5-1.5 / 1.5-3.5 / 3.5-7.5 |
| 37-39 | 1-3 | DODGE_BONUS | Stat | 회피 증가 | 10-30 / 30-70 / 70-150 |
| 40-42 | 1-3 | CRIT_RES | Stat | 크리티컬 저항 증가 | 15-45 / 45-105 / 105-225 |
| 43-45 | 1-3 | HP_RECOVER_ON_KILL | Effect | 고고학 몬스터 처치 시 HP 회복 (%) | 0.5-1 / 1-2 / 2-4 |
| 46 | 2 | DMG_REDUCE | Stat | 받는 데미지 감소 (%) | 1-4 |
| 47-49 | 1-3 | MOVE_SPEED | Stat | 이동 속도 증가 | 1 / 2 / 3 |
| 50-52 | 1-3 | BLOCK_PEN | Stat | 블록 관통 증가 | 25-75 / 75-175 / 175-350 |

**특수 옵션 정보**:

- **데미지 감소 옵션 (ClassID 46)**:
  - 등급: 2 (Mid 등급)
  - Weight: 15 (낮은 확률로 등장)
  - 수치 범위: 1-4%
  - 타입: Stat (스탯 옵션)
  - 설명: 받는 데미지 감소 (%)
  - **참고**: 이 옵션은 등급 2(Mid)이며, Weight가 15로 낮아 다른 옵션에 비해 등장 확률이 낮습니다. 고고학 유물 아이템의 옵션 풀에 포함되어 있을 경우에만 등장할 수 있습니다.

**사용 예시**:
```lua
-- ClassID 1번 옵션 가져오기
local opt_cls = GetClassByType('archeology_option_list', 1)
-- 반환: { ClassID = 1, Grade = 1, Weight = 100, MinValue = 1, MaxValue = 3, ... }

-- 옵션 정보 확인
local weight = TryGetProp(opt_cls, "Weight", 0)
local min_val = TryGetProp(opt_cls, "MinValue", 0)
local max_val = TryGetProp(opt_cls, "MaxValue", 0)
local stat_tag = TryGetProp(opt_cls, "Stat", "")
```

---

## ExProp 속성

### ARCHEOLOGY_MONSTER_SPAWN_RATE
- 몬스터 등장 확률 보너스 (%)
- 최대 50%까지 적용

### ARCHEOLOGY_ELITE_SPAWN_RATE
- 엘리트 몬스터 등장 확률 보너스 (%)
- 최대 25%까지 적용

---

## 주의사항

1. `shared_archeology.lua`의 데이터 초기화는 스크립트 로드 시 자동 실행됩니다.
2. 옵션 롤링 시 풀 크기보다 많은 개수를 요청하면 풀 크기로 제한됩니다.
3. Weight 기반 선택 알고리즘은 `calc_weight_base_random` 함수에서 구현됩니다.
4. 옵션 수치는 정수/실수에 따라 적절한 랜덤 함수가 사용됩니다.


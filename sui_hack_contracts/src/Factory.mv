// Move bytecode v6
module 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb.factory {
use 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::config;
use 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::pool;
use 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::position;
use 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math;
use be21a06129308e0495431d12286127897aff07a8ade3970495a4404d97f9eaaa::linked_table;
use 0000000000000000000000000000000000000000000000000000000000000001::ascii;
use 0000000000000000000000000000000000000000000000000000000000000001::bcs;
use 0000000000000000000000000000000000000000000000000000000000000001::option;
use 0000000000000000000000000000000000000000000000000000000000000001::string;
use 0000000000000000000000000000000000000000000000000000000000000001::type_name;
use 0000000000000000000000000000000000000000000000000000000000000001::vector;
use 0000000000000000000000000000000000000000000000000000000000000002::balance;
use 0000000000000000000000000000000000000000000000000000000000000002::clock;
use 0000000000000000000000000000000000000000000000000000000000000002::coin;
use 0000000000000000000000000000000000000000000000000000000000000002::dynamic_object_field;
use 0000000000000000000000000000000000000000000000000000000000000002::event;
use 0000000000000000000000000000000000000000000000000000000000000002::hash;
use 0000000000000000000000000000000000000000000000000000000000000002::object;
use 0000000000000000000000000000000000000000000000000000000000000002::sui;
use 0000000000000000000000000000000000000000000000000000000000000002::table;
use 0000000000000000000000000000000000000000000000000000000000000002::transfer;
use 0000000000000000000000000000000000000000000000000000000000000002::tx_context;
use 0000000000000000000000000000000000000000000000000000000000000002::vec_map;
use 0000000000000000000000000000000000000000000000000000000000000002::vec_set;

struct PoolSimpleInfo has copy, drop, store {
	pool_id: ID,
	pool_key: ID,
	coin_type_a: TypeName,
	coin_type_b: TypeName,
	tick_spacing: u32
}

struct Pools has store, key {
	id: UID,
	list: LinkedTable<ID, PoolSimpleInfo>,
	index: u64
}

struct DenyCoinList has store, key {
	id: UID,
	denied_list: Table<TypeName, bool>,
	allowed_list: Table<TypeName, bool>
}

struct PoolKey has copy, drop, store {
	coin_a: TypeName,
	coin_b: TypeName,
	tick_spacing: u32
}

struct PermissionPairManager has store, key {
	id: UID,
	allowed_pair_config: Table<TypeName, VecSet<u32>>,
	pool_key_to_cap: Table<ID, ID>,
	cap_to_pool_key: Table<ID, Table<ID, PoolKey>>,
	coin_type_to_cap: Table<TypeName, ID>
}

struct PoolCreationCap has store, key {
	id: UID,
	coin_type: TypeName
}

struct InitFactoryEvent has copy, drop {
	pools_id: ID
}

struct CreatePoolEvent has copy, drop {
	pool_id: ID,
	coin_type_a: String,
	coin_type_b: String,
	tick_spacing: u32
}

struct AddAllowedListEvent has copy, drop {
	coin_type: String
}

struct RemoveAllowedListEvent has copy, drop {
	coin_type: String
}

struct AddDeniedListEvent has copy, drop {
	coin_type: String
}

struct RemoveDeniedListEvent has copy, drop {
	coin_type: String
}

struct InitPermissionPairManagerEvent has copy, drop {
	manager_id: ID,
	denied_list_id: ID
}

struct RegisterPermissionPairEvent has copy, drop {
	cap: ID,
	pool_key: ID,
	coin_type: String,
	coin_pair: String,
	tick_spacing: u32
}

struct UnregisterPermissionPairEvent has copy, drop {
	cap: ID,
	pool_key: ID,
	coin_type: String,
	coin_pair: String,
	tick_spacing: u32
}

struct AddAllowedPairConfigEvent has copy, drop {
	coin_type: String,
	tick_spacing: u32
}

struct RemoveAllowedPairConfigEvent has copy, drop {
	coin_type: String,
	tick_spacing: u32
}

struct MintPoolCreationCap has copy, drop {
	coin_type: String,
	cap: ID
}

struct MintPoolCreationCapByAdmin has copy, drop {
	coin_type: String,
	cap: ID
}

init(Arg0: &mut TxContext) {
L1:	loc0: Pools
L2:	loc1: ID
B0:
	0: CopyLoc[0](Arg0: &mut TxContext)
	1: Call object::new(&mut TxContext): UID
	2: MoveLoc[0](Arg0: &mut TxContext)
	3: Call linked_table::new<ID, PoolSimpleInfo>(&mut TxContext): LinkedTable<ID, PoolSimpleInfo>
	4: LdU64(0)
	5: Pack[1](Pools)
	6: StLoc[1](loc0: Pools)
	7: ImmBorrowLoc[1](loc0: Pools)
	8: Call object::id<Pools>(&Pools): ID
	9: StLoc[2](loc1: ID)
	10: MoveLoc[1](loc0: Pools)
	11: Call transfer::share_object<Pools>(Pools)
	12: MoveLoc[2](loc1: ID)
	13: Pack[6](InitFactoryEvent)
	14: Call event::emit<InitFactoryEvent>(InitFactoryEvent)
	15: Ret
}

public pool_id(Arg0: &PoolSimpleInfo): ID {
B0:
	0: MoveLoc[0](Arg0: &PoolSimpleInfo)
	1: ImmBorrowField[0](PoolSimpleInfo.pool_id: ID)
	2: ReadRef
	3: Ret
}

public pool_key(Arg0: &PoolSimpleInfo): ID {
B0:
	0: MoveLoc[0](Arg0: &PoolSimpleInfo)
	1: ImmBorrowField[1](PoolSimpleInfo.pool_key: ID)
	2: ReadRef
	3: Ret
}

public coin_types(Arg0: &PoolSimpleInfo): TypeName * TypeName {
B0:
	0: CopyLoc[0](Arg0: &PoolSimpleInfo)
	1: ImmBorrowField[2](PoolSimpleInfo.coin_type_a: TypeName)
	2: ReadRef
	3: MoveLoc[0](Arg0: &PoolSimpleInfo)
	4: ImmBorrowField[3](PoolSimpleInfo.coin_type_b: TypeName)
	5: ReadRef
	6: Ret
}

public tick_spacing(Arg0: &PoolSimpleInfo): u32 {
B0:
	0: MoveLoc[0](Arg0: &PoolSimpleInfo)
	1: ImmBorrowField[4](PoolSimpleInfo.tick_spacing: u32)
	2: ReadRef
	3: Ret
}

public index(Arg0: &Pools): u64 {
B0:
	0: MoveLoc[0](Arg0: &Pools)
	1: ImmBorrowField[5](Pools.index: u64)
	2: ReadRef
	3: Ret
}

public pool_simple_info(Arg0: &Pools, Arg1: ID): &PoolSimpleInfo {
B0:
	0: MoveLoc[0](Arg0: &Pools)
	1: ImmBorrowField[6](Pools.list: LinkedTable<ID, PoolSimpleInfo>)
	2: MoveLoc[1](Arg1: ID)
	3: Call linked_table::borrow<ID, PoolSimpleInfo>(&LinkedTable<ID, PoolSimpleInfo>, ID): &PoolSimpleInfo
	4: Ret
}

public in_allowed_list<Ty0>(Arg0: &Pools): bool {
B0:
	0: MoveLoc[0](Arg0: &Pools)
	1: ImmBorrowField[7](Pools.id: UID)
	2: LdConst[1](vector<u8>: "den..)
	3: Call string::utf8(vector<u8>): String
	4: Call dynamic_object_field::borrow<String, DenyCoinList>(&UID, String): &DenyCoinList
	5: ImmBorrowField[8](DenyCoinList.allowed_list: Table<TypeName, bool>)
	6: Call type_name::get<Ty0>(): TypeName
	7: Call table::contains<TypeName, bool>(&Table<TypeName, bool>, TypeName): bool
	8: Ret
}

public in_denied_list<Ty0>(Arg0: &Pools): bool {
B0:
	0: MoveLoc[0](Arg0: &Pools)
	1: ImmBorrowField[7](Pools.id: UID)
	2: LdConst[1](vector<u8>: "den..)
	3: Call string::utf8(vector<u8>): String
	4: Call dynamic_object_field::borrow<String, DenyCoinList>(&UID, String): &DenyCoinList
	5: ImmBorrowField[9](DenyCoinList.denied_list: Table<TypeName, bool>)
	6: Call type_name::get<Ty0>(): TypeName
	7: Call table::contains<TypeName, bool>(&Table<TypeName, bool>, TypeName): bool
	8: Ret
}

public is_allowed_coin<Ty0>(Arg0: &mut Pools, Arg1: &CoinMetadata<Ty0>): bool {
L2:	loc0: bool
B0:
	0: CopyLoc[0](Arg0: &mut Pools)
	1: FreezeRef
	2: Call in_allowed_list<Ty0>(&Pools): bool
	3: BrFalse(9)
B1:
	4: MoveLoc[0](Arg0: &mut Pools)
	5: Pop
	6: LdTrue
	7: StLoc[2](loc0: bool)
	8: Branch(14)
B2:
	9: MoveLoc[0](Arg0: &mut Pools)
	10: FreezeRef
	11: Call in_denied_list<Ty0>(&Pools): bool
	12: Not
	13: StLoc[2](loc0: bool)
B3:
	14: MoveLoc[2](loc0: bool)
	15: Ret
}

public is_permission_pair<Ty0, Ty1>(Arg0: &Pools, Arg1: u32): bool {
L2:	loc0: &PermissionPairManager
L3:	loc1: ID
B0:
	0: MoveLoc[0](Arg0: &Pools)
	1: ImmBorrowField[7](Pools.id: UID)
	2: LdConst[2](vector<u8>: "per..)
	3: Call string::utf8(vector<u8>): String
	4: Call dynamic_object_field::borrow<String, PermissionPairManager>(&UID, String): &PermissionPairManager
	5: StLoc[2](loc0: &PermissionPairManager)
	6: MoveLoc[1](Arg1: u32)
	7: Call new_pool_key<Ty0, Ty1>(u32): ID
	8: StLoc[3](loc1: ID)
	9: MoveLoc[2](loc0: &PermissionPairManager)
	10: ImmBorrowField[10](PermissionPairManager.pool_key_to_cap: Table<ID, ID>)
	11: MoveLoc[3](loc1: ID)
	12: Call table::contains<ID, ID>(&Table<ID, ID>, ID): bool
	13: Ret
}

public permission_pair_cap<Ty0, Ty1>(Arg0: &Pools, Arg1: u32): ID {
L2:	loc0: &PermissionPairManager
L3:	loc1: ID
B0:
	0: MoveLoc[0](Arg0: &Pools)
	1: ImmBorrowField[7](Pools.id: UID)
	2: LdConst[2](vector<u8>: "per..)
	3: Call string::utf8(vector<u8>): String
	4: Call dynamic_object_field::borrow<String, PermissionPairManager>(&UID, String): &PermissionPairManager
	5: StLoc[2](loc0: &PermissionPairManager)
	6: MoveLoc[1](Arg1: u32)
	7: Call new_pool_key<Ty0, Ty1>(u32): ID
	8: StLoc[3](loc1: ID)
	9: CopyLoc[2](loc0: &PermissionPairManager)
	10: ImmBorrowField[10](PermissionPairManager.pool_key_to_cap: Table<ID, ID>)
	11: CopyLoc[3](loc1: ID)
	12: Call table::contains<ID, ID>(&Table<ID, ID>, ID): bool
	13: BrFalse(15)
B1:
	14: Branch(19)
B2:
	15: MoveLoc[2](loc0: &PermissionPairManager)
	16: Pop
	17: LdConst[12](u64: 10)
	18: Abort
B3:
	19: MoveLoc[2](loc0: &PermissionPairManager)
	20: ImmBorrowField[10](PermissionPairManager.pool_key_to_cap: Table<ID, ID>)
	21: MoveLoc[3](loc1: ID)
	22: Call table::borrow<ID, ID>(&Table<ID, ID>, ID): &ID
	23: ReadRef
	24: Ret
}

entry public init_manager_and_whitelist(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: &mut TxContext) {
L3:	loc0: ID
L4:	loc1: PermissionPairManager
L5:	loc2: ID
L6:	loc3: DenyCoinList
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[0](Arg0: &GlobalConfig)
	3: CopyLoc[2](Arg2: &mut TxContext)
	4: FreezeRef
	5: Call tx_context::sender(&TxContext): address
	6: Call config::check_pool_manager_role(&GlobalConfig, address)
	7: CopyLoc[2](Arg2: &mut TxContext)
	8: Call object::new(&mut TxContext): UID
	9: CopyLoc[2](Arg2: &mut TxContext)
	10: Call table::new<TypeName, VecSet<u32>>(&mut TxContext): Table<TypeName, VecSet<u32>>
	11: CopyLoc[2](Arg2: &mut TxContext)
	12: Call table::new<ID, ID>(&mut TxContext): Table<ID, ID>
	13: CopyLoc[2](Arg2: &mut TxContext)
	14: Call table::new<ID, Table<ID, PoolKey>>(&mut TxContext): Table<ID, Table<ID, PoolKey>>
	15: CopyLoc[2](Arg2: &mut TxContext)
	16: Call table::new<TypeName, ID>(&mut TxContext): Table<TypeName, ID>
	17: Pack[4](PermissionPairManager)
	18: StLoc[4](loc1: PermissionPairManager)
	19: MutBorrowLoc[4](loc1: PermissionPairManager)
	20: MutBorrowField[11](PermissionPairManager.allowed_pair_config: Table<TypeName, VecSet<u32>>)
	21: Call type_name::get<SUI>(): TypeName
	22: LdU32(200)
	23: Call vec_set::singleton<u32>(u32): VecSet<u32>
	24: Call table::add<TypeName, VecSet<u32>>(&mut Table<TypeName, VecSet<u32>>, TypeName, VecSet<u32>)
	25: ImmBorrowLoc[4](loc1: PermissionPairManager)
	26: Call object::id<PermissionPairManager>(&PermissionPairManager): ID
	27: StLoc[5](loc2: ID)
	28: CopyLoc[1](Arg1: &mut Pools)
	29: MutBorrowField[7](Pools.id: UID)
	30: LdConst[2](vector<u8>: "per..)
	31: Call string::utf8(vector<u8>): String
	32: MoveLoc[4](loc1: PermissionPairManager)
	33: Call dynamic_object_field::add<String, PermissionPairManager>(&mut UID, String, PermissionPairManager)
	34: CopyLoc[2](Arg2: &mut TxContext)
	35: Call object::new(&mut TxContext): UID
	36: CopyLoc[2](Arg2: &mut TxContext)
	37: Call table::new<TypeName, bool>(&mut TxContext): Table<TypeName, bool>
	38: MoveLoc[2](Arg2: &mut TxContext)
	39: Call table::new<TypeName, bool>(&mut TxContext): Table<TypeName, bool>
	40: Pack[2](DenyCoinList)
	41: StLoc[6](loc3: DenyCoinList)
	42: ImmBorrowLoc[6](loc3: DenyCoinList)
	43: Call object::id<DenyCoinList>(&DenyCoinList): ID
	44: StLoc[3](loc0: ID)
	45: MoveLoc[1](Arg1: &mut Pools)
	46: MutBorrowField[7](Pools.id: UID)
	47: LdConst[1](vector<u8>: "den..)
	48: Call string::utf8(vector<u8>): String
	49: MoveLoc[6](loc3: DenyCoinList)
	50: Call dynamic_object_field::add<String, DenyCoinList>(&mut UID, String, DenyCoinList)
	51: MoveLoc[5](loc2: ID)
	52: MoveLoc[3](loc0: ID)
	53: Pack[12](InitPermissionPairManagerEvent)
	54: Call event::emit<InitPermissionPairManagerEvent>(InitPermissionPairManagerEvent)
	55: Ret
}

public add_allowed_list<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: &TxContext) {
L3:	loc0: TypeName
L4:	loc1: &mut DenyCoinList
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[0](Arg0: &GlobalConfig)
	3: MoveLoc[2](Arg2: &TxContext)
	4: Call tx_context::sender(&TxContext): address
	5: Call config::check_pool_manager_role(&GlobalConfig, address)
	6: Call type_name::get<Ty0>(): TypeName
	7: StLoc[3](loc0: TypeName)
	8: MoveLoc[1](Arg1: &mut Pools)
	9: MutBorrowField[7](Pools.id: UID)
	10: LdConst[1](vector<u8>: "den..)
	11: Call string::utf8(vector<u8>): String
	12: Call dynamic_object_field::borrow_mut<String, DenyCoinList>(&mut UID, String): &mut DenyCoinList
	13: StLoc[4](loc1: &mut DenyCoinList)
	14: CopyLoc[4](loc1: &mut DenyCoinList)
	15: ImmBorrowField[8](DenyCoinList.allowed_list: Table<TypeName, bool>)
	16: CopyLoc[3](loc0: TypeName)
	17: Call table::contains<TypeName, bool>(&Table<TypeName, bool>, TypeName): bool
	18: Not
	19: BrFalse(21)
B1:
	20: Branch(25)
B2:
	21: MoveLoc[4](loc1: &mut DenyCoinList)
	22: Pop
	23: LdConst[16](u64: 14)
	24: Abort
B3:
	25: MoveLoc[4](loc1: &mut DenyCoinList)
	26: MutBorrowField[8](DenyCoinList.allowed_list: Table<TypeName, bool>)
	27: CopyLoc[3](loc0: TypeName)
	28: LdTrue
	29: Call table::add<TypeName, bool>(&mut Table<TypeName, bool>, TypeName, bool)
	30: MoveLoc[3](loc0: TypeName)
	31: Call type_name::into_string(TypeName): String
	32: Call string::from_ascii(String): String
	33: Pack[8](AddAllowedListEvent)
	34: Call event::emit<AddAllowedListEvent>(AddAllowedListEvent)
	35: Ret
}

public remove_allowed_list<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: &TxContext) {
L3:	loc0: TypeName
L4:	loc1: &mut DenyCoinList
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[0](Arg0: &GlobalConfig)
	3: MoveLoc[2](Arg2: &TxContext)
	4: Call tx_context::sender(&TxContext): address
	5: Call config::check_pool_manager_role(&GlobalConfig, address)
	6: Call type_name::get<Ty0>(): TypeName
	7: StLoc[3](loc0: TypeName)
	8: MoveLoc[1](Arg1: &mut Pools)
	9: MutBorrowField[7](Pools.id: UID)
	10: LdConst[1](vector<u8>: "den..)
	11: Call string::utf8(vector<u8>): String
	12: Call dynamic_object_field::borrow_mut<String, DenyCoinList>(&mut UID, String): &mut DenyCoinList
	13: StLoc[4](loc1: &mut DenyCoinList)
	14: CopyLoc[4](loc1: &mut DenyCoinList)
	15: ImmBorrowField[8](DenyCoinList.allowed_list: Table<TypeName, bool>)
	16: CopyLoc[3](loc0: TypeName)
	17: Call table::contains<TypeName, bool>(&Table<TypeName, bool>, TypeName): bool
	18: BrFalse(20)
B1:
	19: Branch(24)
B2:
	20: MoveLoc[4](loc1: &mut DenyCoinList)
	21: Pop
	22: LdConst[17](u64: 15)
	23: Abort
B3:
	24: MoveLoc[4](loc1: &mut DenyCoinList)
	25: MutBorrowField[8](DenyCoinList.allowed_list: Table<TypeName, bool>)
	26: CopyLoc[3](loc0: TypeName)
	27: Call table::remove<TypeName, bool>(&mut Table<TypeName, bool>, TypeName): bool
	28: Pop
	29: MoveLoc[3](loc0: TypeName)
	30: Call type_name::into_string(TypeName): String
	31: Call string::from_ascii(String): String
	32: Pack[9](RemoveAllowedListEvent)
	33: Call event::emit<RemoveAllowedListEvent>(RemoveAllowedListEvent)
	34: Ret
}

public add_denied_list<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: &TxContext) {
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[0](Arg0: &GlobalConfig)
	3: MoveLoc[2](Arg2: &TxContext)
	4: Call tx_context::sender(&TxContext): address
	5: Call config::check_pool_manager_role(&GlobalConfig, address)
	6: MoveLoc[1](Arg1: &mut Pools)
	7: Call add_denied_coin<Ty0>(&mut Pools)
	8: Ret
}

public remove_denied_list<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: &TxContext) {
L3:	loc0: TypeName
L4:	loc1: &mut DenyCoinList
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[0](Arg0: &GlobalConfig)
	3: MoveLoc[2](Arg2: &TxContext)
	4: Call tx_context::sender(&TxContext): address
	5: Call config::check_pool_manager_role(&GlobalConfig, address)
	6: Call type_name::get<Ty0>(): TypeName
	7: StLoc[3](loc0: TypeName)
	8: MoveLoc[1](Arg1: &mut Pools)
	9: MutBorrowField[7](Pools.id: UID)
	10: LdConst[1](vector<u8>: "den..)
	11: Call string::utf8(vector<u8>): String
	12: Call dynamic_object_field::borrow_mut<String, DenyCoinList>(&mut UID, String): &mut DenyCoinList
	13: StLoc[4](loc1: &mut DenyCoinList)
	14: CopyLoc[4](loc1: &mut DenyCoinList)
	15: ImmBorrowField[9](DenyCoinList.denied_list: Table<TypeName, bool>)
	16: CopyLoc[3](loc0: TypeName)
	17: Call table::contains<TypeName, bool>(&Table<TypeName, bool>, TypeName): bool
	18: BrFalse(20)
B1:
	19: Branch(24)
B2:
	20: MoveLoc[4](loc1: &mut DenyCoinList)
	21: Pop
	22: LdConst[17](u64: 15)
	23: Abort
B3:
	24: MoveLoc[4](loc1: &mut DenyCoinList)
	25: MutBorrowField[9](DenyCoinList.denied_list: Table<TypeName, bool>)
	26: CopyLoc[3](loc0: TypeName)
	27: Call table::remove<TypeName, bool>(&mut Table<TypeName, bool>, TypeName): bool
	28: Pop
	29: MoveLoc[3](loc0: TypeName)
	30: Call type_name::into_string(TypeName): String
	31: Call string::from_ascii(String): String
	32: Pack[11](RemoveDeniedListEvent)
	33: Call event::emit<RemoveDeniedListEvent>(RemoveDeniedListEvent)
	34: Ret
}

public add_allowed_pair_config<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: u32, Arg3: &TxContext) {
L4:	loc0: &mut PermissionPairManager
L5:	loc1: TypeName
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: CopyLoc[0](Arg0: &GlobalConfig)
	3: MoveLoc[3](Arg3: &TxContext)
	4: Call tx_context::sender(&TxContext): address
	5: Call config::check_pool_manager_role(&GlobalConfig, address)
	6: MoveLoc[0](Arg0: &GlobalConfig)
	7: Call config::fee_tiers(&GlobalConfig): &VecMap<u32, FeeTier>
	8: ImmBorrowLoc[2](Arg2: u32)
	9: Call vec_map::contains<u32, FeeTier>(&VecMap<u32, FeeTier>, &u32): bool
	10: BrFalse(12)
B1:
	11: Branch(16)
B2:
	12: MoveLoc[1](Arg1: &mut Pools)
	13: Pop
	14: LdConst[19](u64: 17)
	15: Abort
B3:
	16: Call type_name::get<Ty0>(): TypeName
	17: StLoc[5](loc1: TypeName)
	18: MoveLoc[1](Arg1: &mut Pools)
	19: MutBorrowField[7](Pools.id: UID)
	20: LdConst[2](vector<u8>: "per..)
	21: Call string::utf8(vector<u8>): String
	22: Call dynamic_object_field::borrow_mut<String, PermissionPairManager>(&mut UID, String): &mut PermissionPairManager
	23: StLoc[4](loc0: &mut PermissionPairManager)
	24: CopyLoc[4](loc0: &mut PermissionPairManager)
	25: ImmBorrowField[11](PermissionPairManager.allowed_pair_config: Table<TypeName, VecSet<u32>>)
	26: CopyLoc[5](loc1: TypeName)
	27: Call table::contains<TypeName, VecSet<u32>>(&Table<TypeName, VecSet<u32>>, TypeName): bool
	28: Not
	29: BrFalse(35)
B4:
	30: CopyLoc[4](loc0: &mut PermissionPairManager)
	31: MutBorrowField[11](PermissionPairManager.allowed_pair_config: Table<TypeName, VecSet<u32>>)
	32: CopyLoc[5](loc1: TypeName)
	33: Call vec_set::empty<u32>(): VecSet<u32>
	34: Call table::add<TypeName, VecSet<u32>>(&mut Table<TypeName, VecSet<u32>>, TypeName, VecSet<u32>)
B5:
	35: MoveLoc[4](loc0: &mut PermissionPairManager)
	36: MutBorrowField[11](PermissionPairManager.allowed_pair_config: Table<TypeName, VecSet<u32>>)
	37: CopyLoc[5](loc1: TypeName)
	38: Call table::borrow_mut<TypeName, VecSet<u32>>(&mut Table<TypeName, VecSet<u32>>, TypeName): &mut VecSet<u32>
	39: CopyLoc[2](Arg2: u32)
	40: Call vec_set::insert<u32>(&mut VecSet<u32>, u32)
	41: MoveLoc[5](loc1: TypeName)
	42: Call type_name::into_string(TypeName): String
	43: Call string::from_ascii(String): String
	44: MoveLoc[2](Arg2: u32)
	45: Pack[15](AddAllowedPairConfigEvent)
	46: Call event::emit<AddAllowedPairConfigEvent>(AddAllowedPairConfigEvent)
	47: Ret
}

public remove_allowed_pair_config<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: u32, Arg3: &TxContext) {
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[0](Arg0: &GlobalConfig)
	3: MoveLoc[3](Arg3: &TxContext)
	4: Call tx_context::sender(&TxContext): address
	5: Call config::check_pool_manager_role(&GlobalConfig, address)
	6: MoveLoc[1](Arg1: &mut Pools)
	7: MutBorrowField[7](Pools.id: UID)
	8: LdConst[2](vector<u8>: "per..)
	9: Call string::utf8(vector<u8>): String
	10: Call dynamic_object_field::borrow_mut<String, PermissionPairManager>(&mut UID, String): &mut PermissionPairManager
	11: MutBorrowField[11](PermissionPairManager.allowed_pair_config: Table<TypeName, VecSet<u32>>)
	12: Call type_name::get<Ty0>(): TypeName
	13: Call table::borrow_mut<TypeName, VecSet<u32>>(&mut Table<TypeName, VecSet<u32>>, TypeName): &mut VecSet<u32>
	14: ImmBorrowLoc[2](Arg2: u32)
	15: Call vec_set::remove<u32>(&mut VecSet<u32>, &u32)
	16: Call type_name::get<Ty0>(): TypeName
	17: Call type_name::into_string(TypeName): String
	18: Call string::from_ascii(String): String
	19: MoveLoc[2](Arg2: u32)
	20: Pack[16](RemoveAllowedPairConfigEvent)
	21: Call event::emit<RemoveAllowedPairConfigEvent>(RemoveAllowedPairConfigEvent)
	22: Ret
}

public mint_pool_creation_cap<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: &mut TreasuryCap<Ty0>, Arg3: &mut TxContext): PoolCreationCap {
L4:	loc0: TypeName
L5:	loc1: PoolCreationCap
L6:	loc2: &mut PermissionPairManager
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: Call type_name::get<Ty0>(): TypeName
	3: StLoc[4](loc0: TypeName)
	4: MoveLoc[1](Arg1: &mut Pools)
	5: MutBorrowField[7](Pools.id: UID)
	6: LdConst[2](vector<u8>: "per..)
	7: Call string::utf8(vector<u8>): String
	8: Call dynamic_object_field::borrow_mut<String, PermissionPairManager>(&mut UID, String): &mut PermissionPairManager
	9: StLoc[6](loc2: &mut PermissionPairManager)
	10: CopyLoc[6](loc2: &mut PermissionPairManager)
	11: ImmBorrowField[12](PermissionPairManager.coin_type_to_cap: Table<TypeName, ID>)
	12: CopyLoc[4](loc0: TypeName)
	13: Call table::contains<TypeName, ID>(&Table<TypeName, ID>, TypeName): bool
	14: Not
	15: BrFalse(17)
B1:
	16: Branch(23)
B2:
	17: MoveLoc[6](loc2: &mut PermissionPairManager)
	18: Pop
	19: MoveLoc[3](Arg3: &mut TxContext)
	20: Pop
	21: LdConst[13](u64: 11)
	22: Abort
B3:
	23: MoveLoc[3](Arg3: &mut TxContext)
	24: Call object::new(&mut TxContext): UID
	25: CopyLoc[4](loc0: TypeName)
	26: Pack[5](PoolCreationCap)
	27: StLoc[5](loc1: PoolCreationCap)
	28: MoveLoc[6](loc2: &mut PermissionPairManager)
	29: MutBorrowField[12](PermissionPairManager.coin_type_to_cap: Table<TypeName, ID>)
	30: CopyLoc[4](loc0: TypeName)
	31: ImmBorrowLoc[5](loc1: PoolCreationCap)
	32: Call object::id<PoolCreationCap>(&PoolCreationCap): ID
	33: Call table::add<TypeName, ID>(&mut Table<TypeName, ID>, TypeName, ID)
	34: MoveLoc[4](loc0: TypeName)
	35: Call type_name::into_string(TypeName): String
	36: Call string::from_ascii(String): String
	37: ImmBorrowLoc[5](loc1: PoolCreationCap)
	38: Call object::id<PoolCreationCap>(&PoolCreationCap): ID
	39: Pack[17](MintPoolCreationCap)
	40: Call event::emit<MintPoolCreationCap>(MintPoolCreationCap)
	41: MoveLoc[5](loc1: PoolCreationCap)
	42: Ret
}

public mint_pool_creation_cap_by_admin<Ty0>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: &mut TxContext): PoolCreationCap {
L3:	loc0: TypeName
L4:	loc1: PoolCreationCap
L5:	loc2: &mut PermissionPairManager
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[0](Arg0: &GlobalConfig)
	3: CopyLoc[2](Arg2: &mut TxContext)
	4: FreezeRef
	5: Call tx_context::sender(&TxContext): address
	6: Call config::check_pool_manager_role(&GlobalConfig, address)
	7: Call type_name::get<Ty0>(): TypeName
	8: StLoc[3](loc0: TypeName)
	9: MoveLoc[1](Arg1: &mut Pools)
	10: MutBorrowField[7](Pools.id: UID)
	11: LdConst[2](vector<u8>: "per..)
	12: Call string::utf8(vector<u8>): String
	13: Call dynamic_object_field::borrow_mut<String, PermissionPairManager>(&mut UID, String): &mut PermissionPairManager
	14: StLoc[5](loc2: &mut PermissionPairManager)
	15: CopyLoc[5](loc2: &mut PermissionPairManager)
	16: ImmBorrowField[12](PermissionPairManager.coin_type_to_cap: Table<TypeName, ID>)
	17: CopyLoc[3](loc0: TypeName)
	18: Call table::contains<TypeName, ID>(&Table<TypeName, ID>, TypeName): bool
	19: Not
	20: BrFalse(22)
B1:
	21: Branch(28)
B2:
	22: MoveLoc[5](loc2: &mut PermissionPairManager)
	23: Pop
	24: MoveLoc[2](Arg2: &mut TxContext)
	25: Pop
	26: LdConst[13](u64: 11)
	27: Abort
B3:
	28: MoveLoc[2](Arg2: &mut TxContext)
	29: Call object::new(&mut TxContext): UID
	30: CopyLoc[3](loc0: TypeName)
	31: Pack[5](PoolCreationCap)
	32: StLoc[4](loc1: PoolCreationCap)
	33: MoveLoc[5](loc2: &mut PermissionPairManager)
	34: MutBorrowField[12](PermissionPairManager.coin_type_to_cap: Table<TypeName, ID>)
	35: CopyLoc[3](loc0: TypeName)
	36: ImmBorrowLoc[4](loc1: PoolCreationCap)
	37: Call object::id<PoolCreationCap>(&PoolCreationCap): ID
	38: Call table::add<TypeName, ID>(&mut Table<TypeName, ID>, TypeName, ID)
	39: MoveLoc[3](loc0: TypeName)
	40: Call type_name::into_string(TypeName): String
	41: Call string::from_ascii(String): String
	42: ImmBorrowLoc[4](loc1: PoolCreationCap)
	43: Call object::id<PoolCreationCap>(&PoolCreationCap): ID
	44: Pack[18](MintPoolCreationCapByAdmin)
	45: Call event::emit<MintPoolCreationCapByAdmin>(MintPoolCreationCapByAdmin)
	46: MoveLoc[4](loc1: PoolCreationCap)
	47: Ret
}

public register_permission_pair<Ty0, Ty1>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: u32, Arg3: &PoolCreationCap, Arg4: &mut TxContext) {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[1](Arg1: &mut Pools)
	3: MoveLoc[3](Arg3: &PoolCreationCap)
	4: MoveLoc[2](Arg2: u32)
	5: MoveLoc[4](Arg4: &mut TxContext)
	6: Call register_permission_pair_internal<Ty0, Ty1>(&mut Pools, &PoolCreationCap, u32, &mut TxContext)
	7: Ret
}

public unregister_permission_pair<Ty0, Ty1>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: u32, Arg3: &PoolCreationCap) {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: MoveLoc[1](Arg1: &mut Pools)
	3: MoveLoc[3](Arg3: &PoolCreationCap)
	4: MoveLoc[2](Arg2: u32)
	5: Call unregister_permission_pair_internal<Ty0, Ty1>(&mut Pools, &PoolCreationCap, u32)
	6: Ret
}

register_permission_pair_internal<Ty0, Ty1>(Arg0: &mut Pools, Arg1: &PoolCreationCap, Arg2: u32, Arg3: &mut TxContext) {
L4:	loc0: ID
L5:	loc1: ID
L6:	loc2: &mut PermissionPairManager
L7:	loc3: ID
L8:	loc4: TypeName
B0:
	0: MoveLoc[0](Arg0: &mut Pools)
	1: MutBorrowField[7](Pools.id: UID)
	2: LdConst[2](vector<u8>: "per..)
	3: Call string::utf8(vector<u8>): String
	4: Call dynamic_object_field::borrow_mut<String, PermissionPairManager>(&mut UID, String): &mut PermissionPairManager
	5: StLoc[6](loc2: &mut PermissionPairManager)
	6: Call type_name::get<Ty1>(): TypeName
	7: StLoc[8](loc4: TypeName)
	8: CopyLoc[6](loc2: &mut PermissionPairManager)
	9: ImmBorrowField[11](PermissionPairManager.allowed_pair_config: Table<TypeName, VecSet<u32>>)
	10: CopyLoc[8](loc4: TypeName)
	11: Call table::contains<TypeName, VecSet<u32>>(&Table<TypeName, VecSet<u32>>, TypeName): bool
	12: BrFalse(14)
B1:
	13: Branch(22)
B2:
	14: MoveLoc[6](loc2: &mut PermissionPairManager)
	15: Pop
	16: MoveLoc[3](Arg3: &mut TxContext)
	17: Pop
	18: MoveLoc[1](Arg1: &PoolCreationCap)
	19: Pop
	20: LdConst[9](u64: 7)
	21: Abort
B3:
	22: CopyLoc[6](loc2: &mut PermissionPairManager)
	23: ImmBorrowField[11](PermissionPairManager.allowed_pair_config: Table<TypeName, VecSet<u32>>)
	24: CopyLoc[8](loc4: TypeName)
	25: Call table::borrow<TypeName, VecSet<u32>>(&Table<TypeName, VecSet<u32>>, TypeName): &VecSet<u32>
	26: ImmBorrowLoc[2](Arg2: u32)
	27: Call vec_set::contains<u32>(&VecSet<u32>, &u32): bool
	28: BrFalse(30)
B4:
	29: Branch(38)
B5:
	30: MoveLoc[6](loc2: &mut PermissionPairManager)
	31: Pop
	32: MoveLoc[3](Arg3: &mut TxContext)
	33: Pop
	34: MoveLoc[1](Arg1: &PoolCreationCap)
	35: Pop
	36: LdConst[10](u64: 8)
	37: Abort
B6:
	38: Call type_name::get<Ty0>(): TypeName
	39: CopyLoc[1](Arg1: &PoolCreationCap)
	40: ImmBorrowField[13](PoolCreationCap.coin_type: TypeName)
	41: ReadRef
	42: Eq
	43: BrFalse(45)
B7:
	44: Branch(53)
B8:
	45: MoveLoc[6](loc2: &mut PermissionPairManager)
	46: Pop
	47: MoveLoc[3](Arg3: &mut TxContext)
	48: Pop
	49: MoveLoc[1](Arg1: &PoolCreationCap)
	50: Pop
	51: LdConst[15](u64: 13)
	52: Abort
B9:
	53: Call is_right_order<Ty0, Ty1>(): bool
	54: BrFalse(59)
B10:
	55: CopyLoc[2](Arg2: u32)
	56: Call new_pool_key<Ty0, Ty1>(u32): ID
	57: StLoc[4](loc0: ID)
	58: Branch(62)
B11:
	59: CopyLoc[2](Arg2: u32)
	60: Call new_pool_key<Ty1, Ty0>(u32): ID
	61: StLoc[4](loc0: ID)
B12:
	62: MoveLoc[4](loc0: ID)
	63: StLoc[7](loc3: ID)
	64: CopyLoc[6](loc2: &mut PermissionPairManager)
	65: ImmBorrowField[10](PermissionPairManager.pool_key_to_cap: Table<ID, ID>)
	66: CopyLoc[7](loc3: ID)
	67: Call table::contains<ID, ID>(&Table<ID, ID>, ID): bool
	68: Not
	69: BrFalse(71)
B13:
	70: Branch(79)
B14:
	71: MoveLoc[6](loc2: &mut PermissionPairManager)
	72: Pop
	73: MoveLoc[3](Arg3: &mut TxContext)
	74: Pop
	75: MoveLoc[1](Arg1: &PoolCreationCap)
	76: Pop
	77: LdConst[11](u64: 9)
	78: Abort
B15:
	79: CopyLoc[1](Arg1: &PoolCreationCap)
	80: Call object::id<PoolCreationCap>(&PoolCreationCap): ID
	81: StLoc[5](loc1: ID)
	82: CopyLoc[6](loc2: &mut PermissionPairManager)
	83: MutBorrowField[10](PermissionPairManager.pool_key_to_cap: Table<ID, ID>)
	84: CopyLoc[7](loc3: ID)
	85: CopyLoc[5](loc1: ID)
	86: Call table::add<ID, ID>(&mut Table<ID, ID>, ID, ID)
	87: CopyLoc[6](loc2: &mut PermissionPairManager)
	88: ImmBorrowField[14](PermissionPairManager.cap_to_pool_key: Table<ID, Table<ID, PoolKey>>)
	89: CopyLoc[5](loc1: ID)
	90: Call table::contains<ID, Table<ID, PoolKey>>(&Table<ID, Table<ID, PoolKey>>, ID): bool
	91: Not
	92: BrFalse(100)
B16:
	93: CopyLoc[6](loc2: &mut PermissionPairManager)
	94: MutBorrowField[14](PermissionPairManager.cap_to_pool_key: Table<ID, Table<ID, PoolKey>>)
	95: CopyLoc[5](loc1: ID)
	96: MoveLoc[3](Arg3: &mut TxContext)
	97: Call table::new<ID, PoolKey>(&mut TxContext): Table<ID, PoolKey>
	98: Call table::add<ID, Table<ID, PoolKey>>(&mut Table<ID, Table<ID, PoolKey>>, ID, Table<ID, PoolKey>)
	99: Branch(102)
B17:
	100: MoveLoc[3](Arg3: &mut TxContext)
	101: Pop
B18:
	102: MoveLoc[6](loc2: &mut PermissionPairManager)
	103: MutBorrowField[14](PermissionPairManager.cap_to_pool_key: Table<ID, Table<ID, PoolKey>>)
	104: CopyLoc[5](loc1: ID)
	105: Call table::borrow_mut<ID, Table<ID, PoolKey>>(&mut Table<ID, Table<ID, PoolKey>>, ID): &mut Table<ID, PoolKey>
	106: CopyLoc[7](loc3: ID)
	107: CopyLoc[1](Arg1: &PoolCreationCap)
	108: ImmBorrowField[13](PoolCreationCap.coin_type: TypeName)
	109: ReadRef
	110: CopyLoc[8](loc4: TypeName)
	111: CopyLoc[2](Arg2: u32)
	112: Pack[3](PoolKey)
	113: Call table::add<ID, PoolKey>(&mut Table<ID, PoolKey>, ID, PoolKey)
	114: MoveLoc[5](loc1: ID)
	115: MoveLoc[7](loc3: ID)
	116: MoveLoc[1](Arg1: &PoolCreationCap)
	117: ImmBorrowField[13](PoolCreationCap.coin_type: TypeName)
	118: ReadRef
	119: Call type_name::into_string(TypeName): String
	120: Call string::from_ascii(String): String
	121: MoveLoc[8](loc4: TypeName)
	122: Call type_name::into_string(TypeName): String
	123: Call string::from_ascii(String): String
	124: MoveLoc[2](Arg2: u32)
	125: Pack[13](RegisterPermissionPairEvent)
	126: Call event::emit<RegisterPermissionPairEvent>(RegisterPermissionPairEvent)
	127: Ret
}

unregister_permission_pair_internal<Ty0, Ty1>(Arg0: &mut Pools, Arg1: &PoolCreationCap, Arg2: u32) {
L3:	loc0: ID
L4:	loc1: ID
L5:	loc2: &mut PermissionPairManager
L6:	loc3: ID
L7:	loc4: TypeName
B0:
	0: MoveLoc[0](Arg0: &mut Pools)
	1: MutBorrowField[7](Pools.id: UID)
	2: LdConst[2](vector<u8>: "per..)
	3: Call string::utf8(vector<u8>): String
	4: Call dynamic_object_field::borrow_mut<String, PermissionPairManager>(&mut UID, String): &mut PermissionPairManager
	5: StLoc[5](loc2: &mut PermissionPairManager)
	6: Call type_name::get<Ty1>(): TypeName
	7: StLoc[7](loc4: TypeName)
	8: Call is_right_order<Ty0, Ty1>(): bool
	9: BrFalse(14)
B1:
	10: CopyLoc[2](Arg2: u32)
	11: Call new_pool_key<Ty0, Ty1>(u32): ID
	12: StLoc[3](loc0: ID)
	13: Branch(17)
B2:
	14: CopyLoc[2](Arg2: u32)
	15: Call new_pool_key<Ty1, Ty0>(u32): ID
	16: StLoc[3](loc0: ID)
B3:
	17: MoveLoc[3](loc0: ID)
	18: StLoc[6](loc3: ID)
	19: CopyLoc[5](loc2: &mut PermissionPairManager)
	20: ImmBorrowField[10](PermissionPairManager.pool_key_to_cap: Table<ID, ID>)
	21: CopyLoc[6](loc3: ID)
	22: Call table::contains<ID, ID>(&Table<ID, ID>, ID): bool
	23: BrFalse(25)
B4:
	24: Branch(31)
B5:
	25: MoveLoc[5](loc2: &mut PermissionPairManager)
	26: Pop
	27: MoveLoc[1](Arg1: &PoolCreationCap)
	28: Pop
	29: LdConst[12](u64: 10)
	30: Abort
B6:
	31: CopyLoc[1](Arg1: &PoolCreationCap)
	32: Call object::id<PoolCreationCap>(&PoolCreationCap): ID
	33: StLoc[4](loc1: ID)
	34: CopyLoc[5](loc2: &mut PermissionPairManager)
	35: MutBorrowField[10](PermissionPairManager.pool_key_to_cap: Table<ID, ID>)
	36: CopyLoc[6](loc3: ID)
	37: Call table::remove<ID, ID>(&mut Table<ID, ID>, ID): ID
	38: CopyLoc[4](loc1: ID)
	39: Eq
	40: BrFalse(42)
B7:
	41: Branch(48)
B8:
	42: MoveLoc[5](loc2: &mut PermissionPairManager)
	43: Pop
	44: MoveLoc[1](Arg1: &PoolCreationCap)
	45: Pop
	46: LdConst[15](u64: 13)
	47: Abort
B9:
	48: MoveLoc[5](loc2: &mut PermissionPairManager)
	49: MutBorrowField[14](PermissionPairManager.cap_to_pool_key: Table<ID, Table<ID, PoolKey>>)
	50: CopyLoc[4](loc1: ID)
	51: Call table::borrow_mut<ID, Table<ID, PoolKey>>(&mut Table<ID, Table<ID, PoolKey>>, ID): &mut Table<ID, PoolKey>
	52: CopyLoc[6](loc3: ID)
	53: Call table::remove<ID, PoolKey>(&mut Table<ID, PoolKey>, ID): PoolKey
	54: Pop
	55: MoveLoc[4](loc1: ID)
	56: MoveLoc[6](loc3: ID)
	57: MoveLoc[1](Arg1: &PoolCreationCap)
	58: ImmBorrowField[13](PoolCreationCap.coin_type: TypeName)
	59: ReadRef
	60: Call type_name::into_string(TypeName): String
	61: Call string::from_ascii(String): String
	62: MoveLoc[7](loc4: TypeName)
	63: Call type_name::into_string(TypeName): String
	64: Call string::from_ascii(String): String
	65: MoveLoc[2](Arg2: u32)
	66: Pack[14](UnregisterPermissionPairEvent)
	67: Call event::emit<UnregisterPermissionPairEvent>(UnregisterPermissionPairEvent)
	68: Ret
}

add_denied_coin<Ty0>(Arg0: &mut Pools) {
L1:	loc0: TypeName
L2:	loc1: &mut DenyCoinList
B0:
	0: Call type_name::get<Ty0>(): TypeName
	1: StLoc[1](loc0: TypeName)
	2: MoveLoc[0](Arg0: &mut Pools)
	3: MutBorrowField[7](Pools.id: UID)
	4: LdConst[1](vector<u8>: "den..)
	5: Call string::utf8(vector<u8>): String
	6: Call dynamic_object_field::borrow_mut<String, DenyCoinList>(&mut UID, String): &mut DenyCoinList
	7: StLoc[2](loc1: &mut DenyCoinList)
	8: CopyLoc[2](loc1: &mut DenyCoinList)
	9: ImmBorrowField[9](DenyCoinList.denied_list: Table<TypeName, bool>)
	10: CopyLoc[1](loc0: TypeName)
	11: Call table::contains<TypeName, bool>(&Table<TypeName, bool>, TypeName): bool
	12: Not
	13: BrFalse(15)
B1:
	14: Branch(19)
B2:
	15: MoveLoc[2](loc1: &mut DenyCoinList)
	16: Pop
	17: LdConst[16](u64: 14)
	18: Abort
B3:
	19: MoveLoc[2](loc1: &mut DenyCoinList)
	20: MutBorrowField[9](DenyCoinList.denied_list: Table<TypeName, bool>)
	21: CopyLoc[1](loc0: TypeName)
	22: LdTrue
	23: Call table::add<TypeName, bool>(&mut Table<TypeName, bool>, TypeName, bool)
	24: MoveLoc[1](loc0: TypeName)
	25: Call type_name::into_string(TypeName): String
	26: Call string::from_ascii(String): String
	27: Pack[10](AddDeniedListEvent)
	28: Call event::emit<AddDeniedListEvent>(AddDeniedListEvent)
	29: Ret
}

public create_pool<Ty0, Ty1>(Arg0: &mut Pools, Arg1: &GlobalConfig, Arg2: u32, Arg3: u128, Arg4: String, Arg5: &Clock, Arg6: &mut TxContext) {
B0:
	0: CopyLoc[1](Arg1: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: CopyLoc[1](Arg1: &GlobalConfig)
	3: CopyLoc[6](Arg6: &mut TxContext)
	4: FreezeRef
	5: Call tx_context::sender(&TxContext): address
	6: Call config::check_pool_manager_role(&GlobalConfig, address)
	7: MoveLoc[0](Arg0: &mut Pools)
	8: MoveLoc[1](Arg1: &GlobalConfig)
	9: MoveLoc[2](Arg2: u32)
	10: MoveLoc[3](Arg3: u128)
	11: MoveLoc[4](Arg4: String)
	12: MoveLoc[5](Arg5: &Clock)
	13: MoveLoc[6](Arg6: &mut TxContext)
	14: Call create_pool_internal<Ty0, Ty1>(&mut Pools, &GlobalConfig, u32, u128, String, &Clock, &mut TxContext): Pool<Ty0, Ty1>
	15: Call transfer::public_share_object<Pool<Ty0, Ty1>>(Pool<Ty0, Ty1>)
	16: Ret
}

public create_pool_with_liquidity<Ty0, Ty1>(Arg0: &mut Pools, Arg1: &GlobalConfig, Arg2: u32, Arg3: u128, Arg4: String, Arg5: u32, Arg6: u32, Arg7: Coin<Ty0>, Arg8: Coin<Ty1>, Arg9: u64, Arg10: u64, Arg11: bool, Arg12: &Clock, Arg13: &mut TxContext): Position * Coin<Ty0> * Coin<Ty1> {
B0:
	0: LdU64(1)
	1: Abort
}

public(friend) create_pool_v2_<Ty0, Ty1>(Arg0: &GlobalConfig, Arg1: &mut Pools, Arg2: u32, Arg3: u128, Arg4: String, Arg5: u32, Arg6: u32, Arg7: Coin<Ty0>, Arg8: Coin<Ty1>, Arg9: &CoinMetadata<Ty0>, Arg10: &CoinMetadata<Ty1>, Arg11: u64, Arg12: u64, Arg13: bool, Arg14: &Clock, Arg15: &mut TxContext): Position * Coin<Ty0> * Coin<Ty1> {
L16:	loc0: u64
L17:	loc1: u64
L18:	loc2: u64
L19:	loc3: u64
L20:	loc4: Balance<Ty0>
L21:	loc5: Balance<Ty1>
L22:	loc6: Pool<Ty0, Ty1>
L23:	loc7: Position
L24:	loc8: AddLiquidityReceipt<Ty0, Ty1>
B0:
	0: CopyLoc[0](Arg0: &GlobalConfig)
	1: Call config::checked_package_version(&GlobalConfig)
	2: CopyLoc[1](Arg1: &mut Pools)
	3: MoveLoc[9](Arg9: &CoinMetadata<Ty0>)
	4: Call is_allowed_coin<Ty0>(&mut Pools, &CoinMetadata<Ty0>): bool
	5: BrFalse(7)
B1:
	6: Branch(19)
B2:
	7: MoveLoc[1](Arg1: &mut Pools)
	8: Pop
	9: MoveLoc[10](Arg10: &CoinMetadata<Ty1>)
	10: Pop
	11: MoveLoc[15](Arg15: &mut TxContext)
	12: Pop
	13: MoveLoc[0](Arg0: &GlobalConfig)
	14: Pop
	15: MoveLoc[14](Arg14: &Clock)
	16: Pop
	17: LdConst[14](u64: 12)
	18: Abort
B3:
	19: CopyLoc[1](Arg1: &mut Pools)
	20: MoveLoc[10](Arg10: &CoinMetadata<Ty1>)
	21: Call is_allowed_coin<Ty1>(&mut Pools, &CoinMetadata<Ty1>): bool
	22: BrFalse(24)
B4:
	23: Branch(34)
B5:
	24: MoveLoc[1](Arg1: &mut Pools)
	25: Pop
	26: MoveLoc[15](Arg15: &mut TxContext)
	27: Pop
	28: MoveLoc[0](Arg0: &GlobalConfig)
	29: Pop
	30: MoveLoc[14](Arg14: &Clock)
	31: Pop
	32: LdConst[14](u64: 12)
	33: Abort
B6:
	34: MoveLoc[1](Arg1: &mut Pools)
	35: CopyLoc[0](Arg0: &GlobalConfig)
	36: MoveLoc[2](Arg2: u32)
	37: MoveLoc[3](Arg3: u128)
	38: MoveLoc[4](Arg4: String)
	39: CopyLoc[14](Arg14: &Clock)
	40: CopyLoc[15](Arg15: &mut TxContext)
	41: Call create_pool_internal<Ty0, Ty1>(&mut Pools, &GlobalConfig, u32, u128, String, &Clock, &mut TxContext): Pool<Ty0, Ty1>
	42: StLoc[22](loc6: Pool<Ty0, Ty1>)
	43: CopyLoc[0](Arg0: &GlobalConfig)
	44: MutBorrowLoc[22](loc6: Pool<Ty0, Ty1>)
	45: MoveLoc[5](Arg5: u32)
	46: MoveLoc[6](Arg6: u32)
	47: CopyLoc[15](Arg15: &mut TxContext)
	48: Call pool::open_position<Ty0, Ty1>(&GlobalConfig, &mut Pool<Ty0, Ty1>, u32, u32, &mut TxContext): Position
	49: StLoc[23](loc7: Position)
	50: CopyLoc[13](Arg13: bool)
	51: BrFalse(55)
B7:
	52: CopyLoc[11](Arg11: u64)
	53: StLoc[16](loc0: u64)
	54: Branch(57)
B8:
	55: CopyLoc[12](Arg12: u64)
	56: StLoc[16](loc0: u64)
B9:
	57: MoveLoc[16](loc0: u64)
	58: StLoc[17](loc1: u64)
	59: CopyLoc[0](Arg0: &GlobalConfig)
	60: MutBorrowLoc[22](loc6: Pool<Ty0, Ty1>)
	61: MutBorrowLoc[23](loc7: Position)
	62: MoveLoc[17](loc1: u64)
	63: CopyLoc[13](Arg13: bool)
	64: MoveLoc[14](Arg14: &Clock)
	65: Call pool::add_liquidity_fix_coin<Ty0, Ty1>(&GlobalConfig, &mut Pool<Ty0, Ty1>, &mut Position, u64, bool, &Clock): AddLiquidityReceipt<Ty0, Ty1>
	66: StLoc[24](loc8: AddLiquidityReceipt<Ty0, Ty1>)
	67: ImmBorrowLoc[24](loc8: AddLiquidityReceipt<Ty0, Ty1>)
	68: Call pool::add_liquidity_pay_amount<Ty0, Ty1>(&AddLiquidityReceipt<Ty0, Ty1>): u64 * u64
	69: StLoc[19](loc3: u64)
	70: StLoc[18](loc2: u64)
	71: CopyLoc[18](loc2: u64)
	72: LdU64(0)
	73: Gt
	74: BrFalse(76)
B10:
	75: Branch(82)
B11:
	76: MoveLoc[15](Arg15: &mut TxContext)
	77: Pop
	78: MoveLoc[0](Arg0: &GlobalConfig)
	79: Pop
	80: LdConst[18](u64: 16)
	81: Abort
B12:
	82: CopyLoc[19](loc3: u64)
	83: LdU64(0)
	84: Gt
	85: BrFalse(87)
B13:
	86: Branch(93)
B14:
	87: MoveLoc[15](Arg15: &mut TxContext)
	88: Pop
	89: MoveLoc[0](Arg0: &GlobalConfig)
	90: Pop
	91: LdConst[18](u64: 16)
	92: Abort
B15:
	93: ImmBorrowLoc[22](loc6: Pool<Ty0, Ty1>)
	94: Call pool::liquidity<Ty0, Ty1>(&Pool<Ty0, Ty1>): u128
	95: LdU128(0)
	96: Gt
	97: BrFalse(99)
B16:
	98: Branch(105)
B17:
	99: MoveLoc[15](Arg15: &mut TxContext)
	100: Pop
	101: MoveLoc[0](Arg0: &GlobalConfig)
	102: Pop
	103: LdConst[18](u64: 16)
	104: Abort
B18:
	105: MoveLoc[13](Arg13: bool)
	106: BrFalse(119)
B19:
	107: CopyLoc[19](loc3: u64)
	108: MoveLoc[12](Arg12: u64)
	109: Le
	110: BrFalse(112)
B20:
	111: Branch(118)
B21:
	112: MoveLoc[15](Arg15: &mut TxContext)
	113: Pop
	114: MoveLoc[0](Arg0: &GlobalConfig)
	115: Pop
	116: LdConst[6](u64: 4)
	117: Abort
B22:
	118: Branch(130)
B23:
	119: CopyLoc[18](loc2: u64)
	120: MoveLoc[11](Arg11: u64)
	121: Le
	122: BrFalse(124)
B24:
	123: Branch(130)
B25:
	124: MoveLoc[15](Arg15: &mut TxContext)
	125: Pop
	126: MoveLoc[0](Arg0: &GlobalConfig)
	127: Pop
	128: LdConst[7](u64: 5)
	129: Abort
B26:
	130: MutBorrowLoc[7](Arg7: Coin<Ty0>)
	131: MoveLoc[18](loc2: u64)
	132: CopyLoc[15](Arg15: &mut TxContext)
	133: Call coin::split<Ty0>(&mut Coin<Ty0>, u64, &mut TxContext): Coin<Ty0>
	134: Call coin::into_balance<Ty0>(Coin<Ty0>): Balance<Ty0>
	135: MutBorrowLoc[8](Arg8: Coin<Ty1>)
	136: MoveLoc[19](loc3: u64)
	137: MoveLoc[15](Arg15: &mut TxContext)
	138: Call coin::split<Ty1>(&mut Coin<Ty1>, u64, &mut TxContext): Coin<Ty1>
	139: Call coin::into_balance<Ty1>(Coin<Ty1>): Balance<Ty1>
	140: StLoc[21](loc5: Balance<Ty1>)
	141: StLoc[20](loc4: Balance<Ty0>)
	142: MoveLoc[0](Arg0: &GlobalConfig)
	143: MutBorrowLoc[22](loc6: Pool<Ty0, Ty1>)
	144: MoveLoc[20](loc4: Balance<Ty0>)
	145: MoveLoc[21](loc5: Balance<Ty1>)
	146: MoveLoc[24](loc8: AddLiquidityReceipt<Ty0, Ty1>)
	147: Call pool::repay_add_liquidity<Ty0, Ty1>(&GlobalConfig, &mut Pool<Ty0, Ty1>, Balance<Ty0>, Balance<Ty1>, AddLiquidityReceipt<Ty0, Ty1>)
	148: MoveLoc[22](loc6: Pool<Ty0, Ty1>)
	149: Call transfer::public_share_object<Pool<Ty0, Ty1>>(Pool<Ty0, Ty1>)
	150: MoveLoc[23](loc7: Position)
	151: MoveLoc[7](Arg7: Coin<Ty0>)
	152: MoveLoc[8](Arg8: Coin<Ty1>)
	153: Ret
}

create_pool_internal<Ty0, Ty1>(Arg0: &mut Pools, Arg1: &GlobalConfig, Arg2: u32, Arg3: u128, Arg4: String, Arg5: &Clock, Arg6: &mut TxContext): Pool<Ty0, Ty1> {
L7:	loc0: bool
L8:	loc1: String
L9:	loc2: TypeName
L10:	loc3: TypeName
L11:	loc4: u64
L12:	loc5: Pool<Ty0, Ty1>
L13:	loc6: ID
L14:	loc7: ID
L15:	loc8: String
B0:
	0: CopyLoc[3](Arg3: u128)
	1: Call tick_math::min_sqrt_price(): u128
	2: Gt
	3: BrFalse(9)
B1:
	4: CopyLoc[3](Arg3: u128)
	5: Call tick_math::max_sqrt_price(): u128
	6: Lt
	7: StLoc[7](loc0: bool)
	8: Branch(11)
B2:
	9: LdFalse
	10: StLoc[7](loc0: bool)
B3:
	11: MoveLoc[7](loc0: bool)
	12: BrFalse(14)
B4:
	13: Branch(24)
B5:
	14: MoveLoc[0](Arg0: &mut Pools)
	15: Pop
	16: MoveLoc[1](Arg1: &GlobalConfig)
	17: Pop
	18: MoveLoc[6](Arg6: &mut TxContext)
	19: Pop
	20: MoveLoc[5](Arg5: &Clock)
	21: Pop
	22: LdConst[4](u64: 2)
	23: Abort
B6:
	24: Call type_name::get<Ty0>(): TypeName
	25: Call type_name::get<Ty1>(): TypeName
	26: StLoc[10](loc3: TypeName)
	27: StLoc[9](loc2: TypeName)
	28: CopyLoc[9](loc2: TypeName)
	29: CopyLoc[10](loc3: TypeName)
	30: Neq
	31: BrFalse(33)
B7:
	32: Branch(43)
B8:
	33: MoveLoc[0](Arg0: &mut Pools)
	34: Pop
	35: MoveLoc[1](Arg1: &GlobalConfig)
	36: Pop
	37: MoveLoc[6](Arg6: &mut TxContext)
	38: Pop
	39: MoveLoc[5](Arg5: &Clock)
	40: Pop
	41: LdConst[5](u64: 3)
	42: Abort
B9:
	43: CopyLoc[2](Arg2: u32)
	44: Call new_pool_key<Ty0, Ty1>(u32): ID
	45: StLoc[14](loc7: ID)
	46: CopyLoc[0](Arg0: &mut Pools)
	47: ImmBorrowField[6](Pools.list: LinkedTable<ID, PoolSimpleInfo>)
	48: CopyLoc[14](loc7: ID)
	49: Call linked_table::contains<ID, PoolSimpleInfo>(&LinkedTable<ID, PoolSimpleInfo>, ID): bool
	50: BrFalse(61)
B10:
	51: MoveLoc[0](Arg0: &mut Pools)
	52: Pop
	53: MoveLoc[1](Arg1: &GlobalConfig)
	54: Pop
	55: MoveLoc[6](Arg6: &mut TxContext)
	56: Pop
	57: MoveLoc[5](Arg5: &Clock)
	58: Pop
	59: LdConst[3](u64: 1)
	60: Abort
B11:
	61: CopyLoc[2](Arg2: u32)
	62: MoveLoc[1](Arg1: &GlobalConfig)
	63: Call config::get_fee_rate(u32, &GlobalConfig): u64
	64: StLoc[11](loc4: u64)
	65: ImmBorrowLoc[4](Arg4: String)
	66: Call string::length(&String): u64
	67: LdU64(0)
	68: Eq
	69: BrFalse(74)
B12:
	70: LdConst[0](vector<u8>: "htt..)
	71: Call string::utf8(vector<u8>): String
	72: StLoc[8](loc1: String)
	73: Branch(76)
B13:
	74: MoveLoc[4](Arg4: String)
	75: StLoc[8](loc1: String)
B14:
	76: MoveLoc[8](loc1: String)
	77: StLoc[15](loc8: String)
	78: CopyLoc[2](Arg2: u32)
	79: MoveLoc[3](Arg3: u128)
	80: MoveLoc[11](loc4: u64)
	81: MoveLoc[15](loc8: String)
	82: CopyLoc[0](Arg0: &mut Pools)
	83: ImmBorrowField[5](Pools.index: u64)
	84: ReadRef
	85: MoveLoc[5](Arg5: &Clock)
	86: MoveLoc[6](Arg6: &mut TxContext)
	87: Call pool::new<Ty0, Ty1>(u32, u128, u64, String, u64, &Clock, &mut TxContext): Pool<Ty0, Ty1>
	88: StLoc[12](loc5: Pool<Ty0, Ty1>)
	89: CopyLoc[0](Arg0: &mut Pools)
	90: ImmBorrowField[5](Pools.index: u64)
	91: ReadRef
	92: LdU64(1)
	93: Add
	94: CopyLoc[0](Arg0: &mut Pools)
	95: MutBorrowField[5](Pools.index: u64)
	96: WriteRef
	97: ImmBorrowLoc[12](loc5: Pool<Ty0, Ty1>)
	98: Call object::id<Pool<Ty0, Ty1>>(&Pool<Ty0, Ty1>): ID
	99: StLoc[13](loc6: ID)
	100: MoveLoc[0](Arg0: &mut Pools)
	101: MutBorrowField[6](Pools.list: LinkedTable<ID, PoolSimpleInfo>)
	102: CopyLoc[14](loc7: ID)
	103: CopyLoc[13](loc6: ID)
	104: MoveLoc[14](loc7: ID)
	105: CopyLoc[9](loc2: TypeName)
	106: CopyLoc[10](loc3: TypeName)
	107: CopyLoc[2](Arg2: u32)
	108: Pack[0](PoolSimpleInfo)
	109: Call linked_table::push_back<ID, PoolSimpleInfo>(&mut LinkedTable<ID, PoolSimpleInfo>, ID, PoolSimpleInfo)
	110: MoveLoc[13](loc6: ID)
	111: MoveLoc[9](loc2: TypeName)
	112: Call type_name::into_string(TypeName): String
	113: Call string::from_ascii(String): String
	114: MoveLoc[10](loc3: TypeName)
	115: Call type_name::into_string(TypeName): String
	116: Call string::from_ascii(String): String
	117: MoveLoc[2](Arg2: u32)
	118: Pack[7](CreatePoolEvent)
	119: Call event::emit<CreatePoolEvent>(CreatePoolEvent)
	120: MoveLoc[12](loc5: Pool<Ty0, Ty1>)
	121: Ret
}

public fetch_pools(Arg0: &Pools, Arg1: vector<ID>, Arg2: u64): vector<PoolSimpleInfo> {
L3:	loc0: Option<ID>
L4:	loc1: bool
L5:	loc2: u64
L6:	loc3: ID
L7:	loc4: Option<ID>
L8:	loc5: &Node<ID, PoolSimpleInfo>
L9:	loc6: PoolSimpleInfo
L10:	loc7: vector<PoolSimpleInfo>
B0:
	0: VecPack(113, 0)
	1: StLoc[10](loc7: vector<PoolSimpleInfo>)
	2: ImmBorrowLoc[1](Arg1: vector<ID>)
	3: Call vector::is_empty<ID>(&vector<ID>): bool
	4: BrFalse(10)
B1:
	5: CopyLoc[0](Arg0: &Pools)
	6: ImmBorrowField[6](Pools.list: LinkedTable<ID, PoolSimpleInfo>)
	7: Call linked_table::head<ID, PoolSimpleInfo>(&LinkedTable<ID, PoolSimpleInfo>): Option<ID>
	8: StLoc[3](loc0: Option<ID>)
	9: Branch(19)
B2:
	10: CopyLoc[0](Arg0: &Pools)
	11: ImmBorrowField[6](Pools.list: LinkedTable<ID, PoolSimpleInfo>)
	12: ImmBorrowLoc[1](Arg1: vector<ID>)
	13: LdU64(0)
	14: VecImmBorrow(3)
	15: ReadRef
	16: Call linked_table::borrow_node<ID, PoolSimpleInfo>(&LinkedTable<ID, PoolSimpleInfo>, ID): &Node<ID, PoolSimpleInfo>
	17: Call linked_table::next<ID, PoolSimpleInfo>(&Node<ID, PoolSimpleInfo>): Option<ID>
	18: StLoc[3](loc0: Option<ID>)
B3:
	19: MoveLoc[3](loc0: Option<ID>)
	20: StLoc[7](loc4: Option<ID>)
	21: LdU64(0)
	22: StLoc[5](loc2: u64)
B4:
	23: ImmBorrowLoc[7](loc4: Option<ID>)
	24: Call option::is_some<ID>(&Option<ID>): bool
	25: BrFalse(32)
B5:
	26: Branch(27)
B6:
	27: CopyLoc[5](loc2: u64)
	28: CopyLoc[2](Arg2: u64)
	29: Lt
	30: StLoc[4](loc1: bool)
	31: Branch(34)
B7:
	32: LdFalse
	33: StLoc[4](loc1: bool)
B8:
	34: MoveLoc[4](loc1: bool)
	35: BrFalse(60)
B9:
	36: ImmBorrowLoc[7](loc4: Option<ID>)
	37: Call option::borrow<ID>(&Option<ID>): &ID
	38: ReadRef
	39: StLoc[6](loc3: ID)
	40: CopyLoc[0](Arg0: &Pools)
	41: ImmBorrowField[6](Pools.list: LinkedTable<ID, PoolSimpleInfo>)
	42: MoveLoc[6](loc3: ID)
	43: Call linked_table::borrow_node<ID, PoolSimpleInfo>(&LinkedTable<ID, PoolSimpleInfo>, ID): &Node<ID, PoolSimpleInfo>
	44: StLoc[8](loc5: &Node<ID, PoolSimpleInfo>)
	45: CopyLoc[8](loc5: &Node<ID, PoolSimpleInfo>)
	46: Call linked_table::next<ID, PoolSimpleInfo>(&Node<ID, PoolSimpleInfo>): Option<ID>
	47: StLoc[7](loc4: Option<ID>)
	48: MoveLoc[8](loc5: &Node<ID, PoolSimpleInfo>)
	49: Call linked_table::borrow_value<ID, PoolSimpleInfo>(&Node<ID, PoolSimpleInfo>): &PoolSimpleInfo
	50: ReadRef
	51: StLoc[9](loc6: PoolSimpleInfo)
	52: MutBorrowLoc[10](loc7: vector<PoolSimpleInfo>)
	53: MoveLoc[9](loc6: PoolSimpleInfo)
	54: VecPushBack(113)
	55: MoveLoc[5](loc2: u64)
	56: LdU64(1)
	57: Add
	58: StLoc[5](loc2: u64)
	59: Branch(23)
B10:
	60: MoveLoc[0](Arg0: &Pools)
	61: Pop
	62: MoveLoc[10](loc7: vector<PoolSimpleInfo>)
	63: Ret
}

public new_pool_key<Ty0, Ty1>(Arg0: u32): ID {
L1:	loc0: String
L2:	loc1: String
L3:	loc2: bool
L4:	loc3: u8
L5:	loc4: u8
L6:	loc5: bool
L7:	loc6: vector<u8>
L8:	loc7: vector<u8>
L9:	loc8: u64
L10:	loc9: u64
L11:	loc10: u64
B0:
	0: Call type_name::get<Ty0>(): TypeName
	1: Call type_name::into_string(TypeName): String
	2: StLoc[1](loc0: String)
	3: ImmBorrowLoc[1](loc0: String)
	4: Call ascii::as_bytes(&String): &vector<u8>
	5: ReadRef
	6: StLoc[7](loc6: vector<u8>)
	7: Call type_name::get<Ty1>(): TypeName
	8: Call type_name::into_string(TypeName): String
	9: StLoc[2](loc1: String)
	10: ImmBorrowLoc[2](loc1: String)
	11: Call ascii::as_bytes(&String): &vector<u8>
	12: ReadRef
	13: StLoc[8](loc7: vector<u8>)
	14: ImmBorrowLoc[7](loc6: vector<u8>)
	15: VecLen(122)
	16: ImmBorrowLoc[8](loc7: vector<u8>)
	17: VecLen(122)
	18: StLoc[11](loc10: u64)
	19: StLoc[10](loc9: u64)
	20: LdU64(0)
	21: StLoc[9](loc8: u64)
	22: LdFalse
	23: StLoc[6](loc5: bool)
B1:
	24: CopyLoc[9](loc8: u64)
	25: CopyLoc[11](loc10: u64)
	26: Lt
	27: BrFalse(71)
B2:
	28: Branch(29)
B3:
	29: ImmBorrowLoc[8](loc7: vector<u8>)
	30: CopyLoc[9](loc8: u64)
	31: VecImmBorrow(122)
	32: ReadRef
	33: StLoc[5](loc4: u8)
	34: CopyLoc[6](loc5: bool)
	35: Not
	36: BrFalse(42)
B4:
	37: CopyLoc[9](loc8: u64)
	38: CopyLoc[10](loc9: u64)
	39: Lt
	40: StLoc[3](loc2: bool)
	41: Branch(44)
B5:
	42: LdFalse
	43: StLoc[3](loc2: bool)
B6:
	44: MoveLoc[3](loc2: bool)
	45: BrFalse(63)
B7:
	46: ImmBorrowLoc[7](loc6: vector<u8>)
	47: CopyLoc[9](loc8: u64)
	48: VecImmBorrow(122)
	49: ReadRef
	50: StLoc[4](loc3: u8)
	51: CopyLoc[4](loc3: u8)
	52: CopyLoc[5](loc4: u8)
	53: Lt
	54: BrFalse(57)
B8:
	55: LdConst[8](u64: 6)
	56: Abort
B9:
	57: MoveLoc[4](loc3: u8)
	58: CopyLoc[5](loc4: u8)
	59: Gt
	60: BrFalse(63)
B10:
	61: LdTrue
	62: StLoc[6](loc5: bool)
B11:
	63: MutBorrowLoc[7](loc6: vector<u8>)
	64: MoveLoc[5](loc4: u8)
	65: VecPushBack(122)
	66: MoveLoc[9](loc8: u64)
	67: LdU64(1)
	68: Add
	69: StLoc[9](loc8: u64)
	70: Branch(24)
B12:
	71: MoveLoc[6](loc5: bool)
	72: Not
	73: BrFalse(86)
B13:
	74: CopyLoc[10](loc9: u64)
	75: CopyLoc[11](loc10: u64)
	76: Lt
	77: BrFalse(80)
B14:
	78: LdConst[8](u64: 6)
	79: Abort
B15:
	80: MoveLoc[10](loc9: u64)
	81: MoveLoc[11](loc10: u64)
	82: Eq
	83: BrFalse(86)
B16:
	84: LdConst[5](u64: 3)
	85: Abort
B17:
	86: MutBorrowLoc[7](loc6: vector<u8>)
	87: ImmBorrowLoc[0](Arg0: u32)
	88: Call bcs::to_bytes<u32>(&u32): vector<u8>
	89: Call vector::append<u8>(&mut vector<u8>, vector<u8>)
	90: ImmBorrowLoc[7](loc6: vector<u8>)
	91: Call hash::blake2b256(&vector<u8>): vector<u8>
	92: Call object::id_from_bytes(vector<u8>): ID
	93: Ret
}

public is_right_order<Ty0, Ty1>(): bool {
L0:	loc0: String
L1:	loc1: String
L2:	loc2: bool
L3:	loc3: u8
L4:	loc4: u8
L5:	loc5: bool
L6:	loc6: vector<u8>
L7:	loc7: vector<u8>
L8:	loc8: u64
L9:	loc9: u64
L10:	loc10: u64
B0:
	0: Call type_name::get<Ty0>(): TypeName
	1: Call type_name::into_string(TypeName): String
	2: StLoc[0](loc0: String)
	3: ImmBorrowLoc[0](loc0: String)
	4: Call ascii::as_bytes(&String): &vector<u8>
	5: ReadRef
	6: StLoc[6](loc6: vector<u8>)
	7: Call type_name::get<Ty1>(): TypeName
	8: Call type_name::into_string(TypeName): String
	9: StLoc[1](loc1: String)
	10: ImmBorrowLoc[1](loc1: String)
	11: Call ascii::as_bytes(&String): &vector<u8>
	12: ReadRef
	13: StLoc[7](loc7: vector<u8>)
	14: ImmBorrowLoc[6](loc6: vector<u8>)
	15: VecLen(122)
	16: ImmBorrowLoc[7](loc7: vector<u8>)
	17: VecLen(122)
	18: StLoc[10](loc10: u64)
	19: StLoc[9](loc9: u64)
	20: LdU64(0)
	21: StLoc[8](loc8: u64)
	22: LdFalse
	23: StLoc[5](loc5: bool)
B1:
	24: CopyLoc[8](loc8: u64)
	25: CopyLoc[10](loc10: u64)
	26: Lt
	27: BrFalse(68)
B2:
	28: Branch(29)
B3:
	29: ImmBorrowLoc[7](loc7: vector<u8>)
	30: CopyLoc[8](loc8: u64)
	31: VecImmBorrow(122)
	32: ReadRef
	33: StLoc[4](loc4: u8)
	34: CopyLoc[5](loc5: bool)
	35: Not
	36: BrFalse(42)
B4:
	37: CopyLoc[8](loc8: u64)
	38: CopyLoc[9](loc9: u64)
	39: Lt
	40: StLoc[2](loc2: bool)
	41: Branch(44)
B5:
	42: LdFalse
	43: StLoc[2](loc2: bool)
B6:
	44: MoveLoc[2](loc2: bool)
	45: BrFalse(63)
B7:
	46: ImmBorrowLoc[6](loc6: vector<u8>)
	47: CopyLoc[8](loc8: u64)
	48: VecImmBorrow(122)
	49: ReadRef
	50: StLoc[3](loc3: u8)
	51: CopyLoc[3](loc3: u8)
	52: CopyLoc[4](loc4: u8)
	53: Lt
	54: BrFalse(57)
B8:
	55: LdFalse
	56: Ret
B9:
	57: MoveLoc[3](loc3: u8)
	58: MoveLoc[4](loc4: u8)
	59: Gt
	60: BrFalse(63)
B10:
	61: LdTrue
	62: StLoc[5](loc5: bool)
B11:
	63: MoveLoc[8](loc8: u64)
	64: LdU64(1)
	65: Add
	66: StLoc[8](loc8: u64)
	67: Branch(24)
B12:
	68: MoveLoc[5](loc5: bool)
	69: Not
	70: BrFalse(83)
B13:
	71: CopyLoc[9](loc9: u64)
	72: CopyLoc[10](loc10: u64)
	73: Lt
	74: BrFalse(77)
B14:
	75: LdFalse
	76: Ret
B15:
	77: MoveLoc[9](loc9: u64)
	78: MoveLoc[10](loc10: u64)
	79: Eq
	80: BrFalse(83)
B16:
	81: LdFalse
	82: Ret
B17:
	83: LdTrue
	84: Ret
}

Constants [
	0 => vector<u8>: "https://bq7bkvdje7gvgmv66hrxdy7wx5h5ggtrrnmt66rdkkehb64rvz3q.arweave.net/DD4VVGknzVMyvvHjceP2v0_TGnGLWT96I1KIcPuRrnc" // interpreted as UTF8 string
	1 => vector<u8>: "deny_coin_list" // interpreted as UTF8 string
	2 => vector<u8>: "permission_pair_manager" // interpreted as UTF8 string
	3 => u64: 1
	4 => u64: 2
	5 => u64: 3
	6 => u64: 4
	7 => u64: 5
	8 => u64: 6
	9 => u64: 7
	10 => u64: 8
	11 => u64: 9
	12 => u64: 10
	13 => u64: 11
	14 => u64: 12
	15 => u64: 13
	16 => u64: 14
	17 => u64: 15
	18 => u64: 16
	19 => u64: 17
]
}

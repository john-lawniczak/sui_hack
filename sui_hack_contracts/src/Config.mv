// Move bytecode v6
module 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb.config {
use 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::acl;
use 0000000000000000000000000000000000000000000000000000000000000002::event;
use 0000000000000000000000000000000000000000000000000000000000000002::object;
use 0000000000000000000000000000000000000000000000000000000000000002::transfer;
use 0000000000000000000000000000000000000000000000000000000000000002::tx_context;
use 0000000000000000000000000000000000000000000000000000000000000002::vec_map;

struct AdminCap has store, key {
	id: UID
}

struct ProtocolFeeClaimCap has store, key {
	id: UID
}

struct FeeTier has copy, drop, store {
	tick_spacing: u32,
	fee_rate: u64
}

struct GlobalConfig has store, key {
	id: UID,
	protocol_fee_rate: u64,
	fee_tiers: VecMap<u32, FeeTier>,
	acl: ACL,
	package_version: u64
}

struct InitConfigEvent has copy, drop {
	admin_cap_id: ID,
	global_config_id: ID
}

struct UpdateFeeRateEvent has copy, drop {
	old_fee_rate: u64,
	new_fee_rate: u64
}

struct AddFeeTierEvent has copy, drop {
	tick_spacing: u32,
	fee_rate: u64
}

struct UpdateFeeTierEvent has copy, drop {
	tick_spacing: u32,
	old_fee_rate: u64,
	new_fee_rate: u64
}

struct DeleteFeeTierEvent has copy, drop {
	tick_spacing: u32,
	fee_rate: u64
}

struct SetRolesEvent has copy, drop {
	member: address,
	roles: u128
}

struct AddRoleEvent has copy, drop {
	member: address,
	role: u8
}

struct RemoveRoleEvent has copy, drop {
	member: address,
	role: u8
}

struct RemoveMemberEvent has copy, drop {
	member: address
}

struct SetPackageVersion has copy, drop {
	new_version: u64,
	old_version: u64
}

init(Arg0: &mut TxContext) {
L1:	loc0: AdminCap
L2:	loc1: ID
L3:	loc2: GlobalConfig
L4:	loc3: ID
L5:	loc4: u128
L6:	loc5: address
B0:
	0: CopyLoc[0](Arg0: &mut TxContext)
	1: Call object::new(&mut TxContext): UID
	2: LdConst[2](u64: 2000)
	3: Call vec_map::empty<u32, FeeTier>(): VecMap<u32, FeeTier>
	4: CopyLoc[0](Arg0: &mut TxContext)
	5: Call acl::new(&mut TxContext): ACL
	6: LdU64(1)
	7: Pack[3](GlobalConfig)
	8: CopyLoc[0](Arg0: &mut TxContext)
	9: Call object::new(&mut TxContext): UID
	10: Pack[0](AdminCap)
	11: StLoc[1](loc0: AdminCap)
	12: StLoc[3](loc2: GlobalConfig)
	13: ImmBorrowLoc[3](loc2: GlobalConfig)
	14: Call object::id<GlobalConfig>(&GlobalConfig): ID
	15: ImmBorrowLoc[1](loc0: AdminCap)
	16: Call object::id<AdminCap>(&AdminCap): ID
	17: StLoc[2](loc1: ID)
	18: StLoc[4](loc3: ID)
	19: MoveLoc[0](Arg0: &mut TxContext)
	20: FreezeRef
	21: Call tx_context::sender(&TxContext): address
	22: StLoc[6](loc5: address)
	23: LdU128(0)
	24: LdU128(1)
	25: LdConst[3](u8: 0)
	26: Shl
	27: BitOr
	28: LdU128(1)
	29: LdConst[4](u8: 1)
	30: Shl
	31: BitOr
	32: LdU128(1)
	33: LdConst[7](u8: 4)
	34: Shl
	35: BitOr
	36: LdU128(1)
	37: LdConst[6](u8: 3)
	38: Shl
	39: BitOr
	40: StLoc[5](loc4: u128)
	41: ImmBorrowLoc[1](loc0: AdminCap)
	42: MutBorrowLoc[3](loc2: GlobalConfig)
	43: CopyLoc[6](loc5: address)
	44: MoveLoc[5](loc4: u128)
	45: Call set_roles(&AdminCap, &mut GlobalConfig, address, u128)
	46: MoveLoc[1](loc0: AdminCap)
	47: MoveLoc[6](loc5: address)
	48: Call transfer::transfer<AdminCap>(AdminCap, address)
	49: MoveLoc[3](loc2: GlobalConfig)
	50: Call transfer::share_object<GlobalConfig>(GlobalConfig)
	51: MoveLoc[2](loc1: ID)
	52: MoveLoc[4](loc3: ID)
	53: Pack[4](InitConfigEvent)
	54: Call event::emit<InitConfigEvent>(InitConfigEvent)
	55: Ret
}

public update_protocol_fee_rate(Arg0: &mut GlobalConfig, Arg1: u64, Arg2: &TxContext) {
L3:	loc0: address
L4:	loc1: u64
B0:
	0: CopyLoc[1](Arg1: u64)
	1: LdConst[1](u64: 3000)
	2: Le
	3: BrFalse(5)
B1:
	4: Branch(11)
B2:
	5: MoveLoc[2](Arg2: &TxContext)
	6: Pop
	7: MoveLoc[0](Arg0: &mut GlobalConfig)
	8: Pop
	9: LdConst[12](u64: 4)
	10: Abort
B3:
	11: CopyLoc[0](Arg0: &mut GlobalConfig)
	12: FreezeRef
	13: Call checked_package_version(&GlobalConfig)
	14: CopyLoc[0](Arg0: &mut GlobalConfig)
	15: MoveLoc[2](Arg2: &TxContext)
	16: Call tx_context::sender(&TxContext): address
	17: StLoc[3](loc0: address)
	18: FreezeRef
	19: MoveLoc[3](loc0: address)
	20: Call check_pool_manager_role(&GlobalConfig, address)
	21: CopyLoc[0](Arg0: &mut GlobalConfig)
	22: ImmBorrowField[0](GlobalConfig.protocol_fee_rate: u64)
	23: ReadRef
	24: StLoc[4](loc1: u64)
	25: CopyLoc[1](Arg1: u64)
	26: MoveLoc[0](Arg0: &mut GlobalConfig)
	27: MutBorrowField[0](GlobalConfig.protocol_fee_rate: u64)
	28: WriteRef
	29: MoveLoc[4](loc1: u64)
	30: MoveLoc[1](Arg1: u64)
	31: Pack[5](UpdateFeeRateEvent)
	32: Call event::emit<UpdateFeeRateEvent>(UpdateFeeRateEvent)
	33: Ret
}

public add_fee_tier(Arg0: &mut GlobalConfig, Arg1: u32, Arg2: u64, Arg3: &TxContext) {
L4:	loc0: address
B0:
	0: CopyLoc[2](Arg2: u64)
	1: LdConst[0](u64: 200000)
	2: Le
	3: BrFalse(5)
B1:
	4: Branch(11)
B2:
	5: MoveLoc[3](Arg3: &TxContext)
	6: Pop
	7: MoveLoc[0](Arg0: &mut GlobalConfig)
	8: Pop
	9: LdConst[11](u64: 3)
	10: Abort
B3:
	11: CopyLoc[0](Arg0: &mut GlobalConfig)
	12: ImmBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	13: ImmBorrowLoc[1](Arg1: u32)
	14: Call vec_map::contains<u32, FeeTier>(&VecMap<u32, FeeTier>, &u32): bool
	15: Not
	16: BrFalse(18)
B4:
	17: Branch(24)
B5:
	18: MoveLoc[3](Arg3: &TxContext)
	19: Pop
	20: MoveLoc[0](Arg0: &mut GlobalConfig)
	21: Pop
	22: LdConst[9](u64: 1)
	23: Abort
B6:
	24: CopyLoc[0](Arg0: &mut GlobalConfig)
	25: FreezeRef
	26: Call checked_package_version(&GlobalConfig)
	27: CopyLoc[0](Arg0: &mut GlobalConfig)
	28: MoveLoc[3](Arg3: &TxContext)
	29: Call tx_context::sender(&TxContext): address
	30: StLoc[4](loc0: address)
	31: FreezeRef
	32: MoveLoc[4](loc0: address)
	33: Call check_fee_tier_manager_role(&GlobalConfig, address)
	34: MoveLoc[0](Arg0: &mut GlobalConfig)
	35: MutBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	36: CopyLoc[1](Arg1: u32)
	37: CopyLoc[1](Arg1: u32)
	38: CopyLoc[2](Arg2: u64)
	39: Pack[2](FeeTier)
	40: Call vec_map::insert<u32, FeeTier>(&mut VecMap<u32, FeeTier>, u32, FeeTier)
	41: MoveLoc[1](Arg1: u32)
	42: MoveLoc[2](Arg2: u64)
	43: Pack[6](AddFeeTierEvent)
	44: Call event::emit<AddFeeTierEvent>(AddFeeTierEvent)
	45: Ret
}

public delete_fee_tier(Arg0: &mut GlobalConfig, Arg1: u32, Arg2: &TxContext) {
L3:	loc0: address
L4:	loc1: FeeTier
B0:
	0: CopyLoc[0](Arg0: &mut GlobalConfig)
	1: ImmBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	2: ImmBorrowLoc[1](Arg1: u32)
	3: Call vec_map::contains<u32, FeeTier>(&VecMap<u32, FeeTier>, &u32): bool
	4: BrFalse(6)
B1:
	5: Branch(12)
B2:
	6: MoveLoc[2](Arg2: &TxContext)
	7: Pop
	8: MoveLoc[0](Arg0: &mut GlobalConfig)
	9: Pop
	10: LdConst[10](u64: 2)
	11: Abort
B3:
	12: CopyLoc[0](Arg0: &mut GlobalConfig)
	13: FreezeRef
	14: Call checked_package_version(&GlobalConfig)
	15: CopyLoc[0](Arg0: &mut GlobalConfig)
	16: MoveLoc[2](Arg2: &TxContext)
	17: Call tx_context::sender(&TxContext): address
	18: StLoc[3](loc0: address)
	19: FreezeRef
	20: MoveLoc[3](loc0: address)
	21: Call check_fee_tier_manager_role(&GlobalConfig, address)
	22: MoveLoc[0](Arg0: &mut GlobalConfig)
	23: MutBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	24: ImmBorrowLoc[1](Arg1: u32)
	25: Call vec_map::remove<u32, FeeTier>(&mut VecMap<u32, FeeTier>, &u32): u32 * FeeTier
	26: StLoc[4](loc1: FeeTier)
	27: Pop
	28: MoveLoc[1](Arg1: u32)
	29: ImmBorrowLoc[4](loc1: FeeTier)
	30: ImmBorrowField[2](FeeTier.fee_rate: u64)
	31: ReadRef
	32: Pack[8](DeleteFeeTierEvent)
	33: Call event::emit<DeleteFeeTierEvent>(DeleteFeeTierEvent)
	34: Ret
}

public update_fee_tier(Arg0: &mut GlobalConfig, Arg1: u32, Arg2: u64, Arg3: &TxContext) {
L4:	loc0: address
L5:	loc1: &mut FeeTier
L6:	loc2: u64
B0:
	0: CopyLoc[0](Arg0: &mut GlobalConfig)
	1: ImmBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	2: ImmBorrowLoc[1](Arg1: u32)
	3: Call vec_map::contains<u32, FeeTier>(&VecMap<u32, FeeTier>, &u32): bool
	4: BrFalse(6)
B1:
	5: Branch(12)
B2:
	6: MoveLoc[3](Arg3: &TxContext)
	7: Pop
	8: MoveLoc[0](Arg0: &mut GlobalConfig)
	9: Pop
	10: LdConst[10](u64: 2)
	11: Abort
B3:
	12: CopyLoc[2](Arg2: u64)
	13: LdConst[0](u64: 200000)
	14: Le
	15: BrFalse(17)
B4:
	16: Branch(23)
B5:
	17: MoveLoc[3](Arg3: &TxContext)
	18: Pop
	19: MoveLoc[0](Arg0: &mut GlobalConfig)
	20: Pop
	21: LdConst[11](u64: 3)
	22: Abort
B6:
	23: CopyLoc[0](Arg0: &mut GlobalConfig)
	24: FreezeRef
	25: Call checked_package_version(&GlobalConfig)
	26: CopyLoc[0](Arg0: &mut GlobalConfig)
	27: MoveLoc[3](Arg3: &TxContext)
	28: Call tx_context::sender(&TxContext): address
	29: StLoc[4](loc0: address)
	30: FreezeRef
	31: MoveLoc[4](loc0: address)
	32: Call check_fee_tier_manager_role(&GlobalConfig, address)
	33: MoveLoc[0](Arg0: &mut GlobalConfig)
	34: MutBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	35: ImmBorrowLoc[1](Arg1: u32)
	36: Call vec_map::get_mut<u32, FeeTier>(&mut VecMap<u32, FeeTier>, &u32): &mut FeeTier
	37: StLoc[5](loc1: &mut FeeTier)
	38: CopyLoc[5](loc1: &mut FeeTier)
	39: ImmBorrowField[2](FeeTier.fee_rate: u64)
	40: ReadRef
	41: StLoc[6](loc2: u64)
	42: CopyLoc[2](Arg2: u64)
	43: MoveLoc[5](loc1: &mut FeeTier)
	44: MutBorrowField[2](FeeTier.fee_rate: u64)
	45: WriteRef
	46: MoveLoc[1](Arg1: u32)
	47: MoveLoc[6](loc2: u64)
	48: MoveLoc[2](Arg2: u64)
	49: Pack[7](UpdateFeeTierEvent)
	50: Call event::emit<UpdateFeeTierEvent>(UpdateFeeTierEvent)
	51: Ret
}

public set_roles(Arg0: &AdminCap, Arg1: &mut GlobalConfig, Arg2: address, Arg3: u128) {
B0:
	0: CopyLoc[1](Arg1: &mut GlobalConfig)
	1: FreezeRef
	2: Call checked_package_version(&GlobalConfig)
	3: MoveLoc[1](Arg1: &mut GlobalConfig)
	4: MutBorrowField[3](GlobalConfig.acl: ACL)
	5: CopyLoc[2](Arg2: address)
	6: CopyLoc[3](Arg3: u128)
	7: Call acl::set_roles(&mut ACL, address, u128)
	8: MoveLoc[2](Arg2: address)
	9: MoveLoc[3](Arg3: u128)
	10: Pack[9](SetRolesEvent)
	11: Call event::emit<SetRolesEvent>(SetRolesEvent)
	12: Ret
}

public add_role(Arg0: &AdminCap, Arg1: &mut GlobalConfig, Arg2: address, Arg3: u8) {
B0:
	0: CopyLoc[1](Arg1: &mut GlobalConfig)
	1: FreezeRef
	2: Call checked_package_version(&GlobalConfig)
	3: MoveLoc[1](Arg1: &mut GlobalConfig)
	4: MutBorrowField[3](GlobalConfig.acl: ACL)
	5: CopyLoc[2](Arg2: address)
	6: CopyLoc[3](Arg3: u8)
	7: Call acl::add_role(&mut ACL, address, u8)
	8: MoveLoc[2](Arg2: address)
	9: MoveLoc[3](Arg3: u8)
	10: Pack[10](AddRoleEvent)
	11: Call event::emit<AddRoleEvent>(AddRoleEvent)
	12: Ret
}

public remove_role(Arg0: &AdminCap, Arg1: &mut GlobalConfig, Arg2: address, Arg3: u8) {
B0:
	0: CopyLoc[1](Arg1: &mut GlobalConfig)
	1: FreezeRef
	2: Call checked_package_version(&GlobalConfig)
	3: MoveLoc[1](Arg1: &mut GlobalConfig)
	4: MutBorrowField[3](GlobalConfig.acl: ACL)
	5: CopyLoc[2](Arg2: address)
	6: CopyLoc[3](Arg3: u8)
	7: Call acl::remove_role(&mut ACL, address, u8)
	8: MoveLoc[2](Arg2: address)
	9: MoveLoc[3](Arg3: u8)
	10: Pack[11](RemoveRoleEvent)
	11: Call event::emit<RemoveRoleEvent>(RemoveRoleEvent)
	12: Ret
}

public remove_member(Arg0: &AdminCap, Arg1: &mut GlobalConfig, Arg2: address) {
B0:
	0: CopyLoc[1](Arg1: &mut GlobalConfig)
	1: FreezeRef
	2: Call checked_package_version(&GlobalConfig)
	3: MoveLoc[1](Arg1: &mut GlobalConfig)
	4: MutBorrowField[3](GlobalConfig.acl: ACL)
	5: CopyLoc[2](Arg2: address)
	6: Call acl::remove_member(&mut ACL, address)
	7: MoveLoc[2](Arg2: address)
	8: Pack[12](RemoveMemberEvent)
	9: Call event::emit<RemoveMemberEvent>(RemoveMemberEvent)
	10: Ret
}

public get_members(Arg0: &GlobalConfig): vector<Member> {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[3](GlobalConfig.acl: ACL)
	2: Call acl::get_members(&ACL): vector<Member>
	3: Ret
}

public get_protocol_fee_rate(Arg0: &GlobalConfig): u64 {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[0](GlobalConfig.protocol_fee_rate: u64)
	2: ReadRef
	3: Ret
}

public get_fee_rate(Arg0: u32, Arg1: &GlobalConfig): u64 {
B0:
	0: CopyLoc[1](Arg1: &GlobalConfig)
	1: ImmBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	2: ImmBorrowLoc[0](Arg0: u32)
	3: Call vec_map::contains<u32, FeeTier>(&VecMap<u32, FeeTier>, &u32): bool
	4: BrFalse(6)
B1:
	5: Branch(10)
B2:
	6: MoveLoc[1](Arg1: &GlobalConfig)
	7: Pop
	8: LdConst[10](u64: 2)
	9: Abort
B3:
	10: MoveLoc[1](Arg1: &GlobalConfig)
	11: ImmBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	12: ImmBorrowLoc[0](Arg0: u32)
	13: Call vec_map::get<u32, FeeTier>(&VecMap<u32, FeeTier>, &u32): &FeeTier
	14: ImmBorrowField[2](FeeTier.fee_rate: u64)
	15: ReadRef
	16: Ret
}

public max_fee_rate(): u64 {
B0:
	0: LdConst[0](u64: 200000)
	1: Ret
}

public max_protocol_fee_rate(): u64 {
B0:
	0: LdConst[1](u64: 3000)
	1: Ret
}

public is_pool_manager(Arg0: &GlobalConfig, Arg1: address): bool {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[3](GlobalConfig.acl: ACL)
	2: MoveLoc[1](Arg1: address)
	3: LdConst[3](u8: 0)
	4: Call acl::has_role(&ACL, address, u8): bool
	5: Ret
}

public check_pool_manager_role(Arg0: &GlobalConfig, Arg1: address) {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: MoveLoc[1](Arg1: address)
	2: Call is_pool_manager(&GlobalConfig, address): bool
	3: BrFalse(5)
B1:
	4: Branch(7)
B2:
	5: LdConst[13](u64: 5)
	6: Abort
B3:
	7: Ret
}

public check_fee_tier_manager_role(Arg0: &GlobalConfig, Arg1: address) {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[3](GlobalConfig.acl: ACL)
	2: MoveLoc[1](Arg1: address)
	3: LdConst[4](u8: 1)
	4: Call acl::has_role(&ACL, address, u8): bool
	5: BrFalse(7)
B1:
	6: Branch(9)
B2:
	7: LdConst[14](u64: 6)
	8: Abort
B3:
	9: Ret
}

public check_protocol_fee_claim_role(Arg0: &GlobalConfig, Arg1: address) {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[3](GlobalConfig.acl: ACL)
	2: MoveLoc[1](Arg1: address)
	3: LdConst[5](u8: 2)
	4: Call acl::has_role(&ACL, address, u8): bool
	5: BrFalse(7)
B1:
	6: Branch(9)
B2:
	7: LdConst[17](u64: 9)
	8: Abort
B3:
	9: Ret
}

public check_partner_manager_role(Arg0: &GlobalConfig, Arg1: address) {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[3](GlobalConfig.acl: ACL)
	2: MoveLoc[1](Arg1: address)
	3: LdConst[6](u8: 3)
	4: Call acl::has_role(&ACL, address, u8): bool
	5: BrFalse(7)
B1:
	6: Branch(9)
B2:
	7: LdConst[15](u64: 7)
	8: Abort
B3:
	9: Ret
}

public check_rewarder_manager_role(Arg0: &GlobalConfig, Arg1: address) {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[3](GlobalConfig.acl: ACL)
	2: MoveLoc[1](Arg1: address)
	3: LdConst[7](u8: 4)
	4: Call acl::has_role(&ACL, address, u8): bool
	5: BrFalse(7)
B1:
	6: Branch(9)
B2:
	7: LdConst[16](u64: 8)
	8: Abort
B3:
	9: Ret
}

public tick_spacing(Arg0: &FeeTier): u32 {
B0:
	0: MoveLoc[0](Arg0: &FeeTier)
	1: ImmBorrowField[4](FeeTier.tick_spacing: u32)
	2: ReadRef
	3: Ret
}

public fee_rate(Arg0: &FeeTier): u64 {
B0:
	0: MoveLoc[0](Arg0: &FeeTier)
	1: ImmBorrowField[2](FeeTier.fee_rate: u64)
	2: ReadRef
	3: Ret
}

public protocol_fee_rate(Arg0: &GlobalConfig): u64 {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[0](GlobalConfig.protocol_fee_rate: u64)
	2: ReadRef
	3: Ret
}

public fee_tiers(Arg0: &GlobalConfig): &VecMap<u32, FeeTier> {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[1](GlobalConfig.fee_tiers: VecMap<u32, FeeTier>)
	2: Ret
}

public acl(Arg0: &GlobalConfig): &ACL {
B0:
	0: MoveLoc[0](Arg0: &GlobalConfig)
	1: ImmBorrowField[3](GlobalConfig.acl: ACL)
	2: Ret
}

public checked_package_version(Arg0: &GlobalConfig) {
B0:
	0: LdConst[8](u64: 10)
	1: MoveLoc[0](Arg0: &GlobalConfig)
	2: ImmBorrowField[5](GlobalConfig.package_version: u64)
	3: ReadRef
	4: Ge
	5: BrFalse(7)
B1:
	6: Branch(9)
B2:
	7: LdConst[8](u64: 10)
	8: Abort
B3:
	9: Ret
}

public update_package_version(Arg0: &AdminCap, Arg1: &mut GlobalConfig, Arg2: u64) {
L3:	loc0: u64
B0:
	0: CopyLoc[1](Arg1: &mut GlobalConfig)
	1: ImmBorrowField[5](GlobalConfig.package_version: u64)
	2: ReadRef
	3: StLoc[3](loc0: u64)
	4: CopyLoc[2](Arg2: u64)
	5: MoveLoc[1](Arg1: &mut GlobalConfig)
	6: MutBorrowField[5](GlobalConfig.package_version: u64)
	7: WriteRef
	8: MoveLoc[2](Arg2: u64)
	9: MoveLoc[3](loc0: u64)
	10: Pack[13](SetPackageVersion)
	11: Call event::emit<SetPackageVersion>(SetPackageVersion)
	12: Ret
}

public package_version(): u64 {
B0:
	0: LdConst[8](u64: 10)
	1: Ret
}

Constants [
	0 => u64: 200000
	1 => u64: 3000
	2 => u64: 2000
	3 => u8: 0
	4 => u8: 1
	5 => u8: 2
	6 => u8: 3
	7 => u8: 4
	8 => u64: 10
	9 => u64: 1
	10 => u64: 2
	11 => u64: 3
	12 => u64: 4
	13 => u64: 5
	14 => u64: 6
	15 => u64: 7
	16 => u64: 8
	17 => u64: 9
]
}

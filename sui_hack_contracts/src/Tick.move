// Move bytecode v6
module 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb.tick {
use 1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math;
use 714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i128;
use 714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32;
use 714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u128;
use be21a06129308e0495431d12286127897aff07a8ade3970495a4404d97f9eaaa::option_u64;
use be21a06129308e0495431d12286127897aff07a8ade3970495a4404d97f9eaaa::skip_list;
use 0000000000000000000000000000000000000000000000000000000000000001::option;
use 0000000000000000000000000000000000000000000000000000000000000001::vector;
use 0000000000000000000000000000000000000000000000000000000000000002::tx_context;

struct TickManager has store {
	tick_spacing: u32,
	ticks: SkipList<Tick>
}

struct Tick has copy, drop, store {
	index: I32,
	sqrt_price: u128,
	liquidity_net: I128,
	liquidity_gross: u128,
	fee_growth_outside_a: u128,
	fee_growth_outside_b: u128,
	points_growth_outside: u128,
	rewards_growth_outside: vector<u128>
}

public(friend) new(Arg0: u32, Arg1: u64, Arg2: &mut TxContext): TickManager {
B0:
	0: MoveLoc[0](Arg0: u32)
	1: LdU64(16)
	2: LdU64(2)
	3: MoveLoc[1](Arg1: u64)
	4: MoveLoc[2](Arg2: &mut TxContext)
	5: Call skip_list::new<Tick>(u64, u64, u64, &mut TxContext): SkipList<Tick>
	6: Pack[0](TickManager)
	7: Ret
}

public(friend) increase_liquidity(Arg0: &mut TickManager, Arg1: I32, Arg2: I32, Arg3: I32, Arg4: u128, Arg5: u128, Arg6: u128, Arg7: u128, Arg8: vector<u128>) {
L9:	loc0: bool
L10:	loc1: bool
L11:	loc2: u64
L12:	loc3: u64
B0:
	0: CopyLoc[4](Arg4: u128)
	1: LdU128(0)
	2: Eq
	3: BrFalse(7)
B1:
	4: MoveLoc[0](Arg0: &mut TickManager)
	5: Pop
	6: Ret
B2:
	7: CopyLoc[2](Arg2: I32)
	8: Call tick_score(I32): u64
	9: CopyLoc[3](Arg3: I32)
	10: Call tick_score(I32): u64
	11: StLoc[12](loc3: u64)
	12: StLoc[11](loc2: u64)
	13: LdFalse
	14: LdFalse
	15: StLoc[10](loc1: bool)
	16: StLoc[9](loc0: bool)
	17: CopyLoc[0](Arg0: &mut TickManager)
	18: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	19: CopyLoc[11](loc2: u64)
	20: Call skip_list::contains<Tick>(&SkipList<Tick>, u64): bool
	21: Not
	22: BrFalse(31)
B3:
	23: CopyLoc[0](Arg0: &mut TickManager)
	24: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	25: CopyLoc[11](loc2: u64)
	26: MoveLoc[2](Arg2: I32)
	27: Call default(I32): Tick
	28: Call skip_list::insert<Tick>(&mut SkipList<Tick>, u64, Tick)
	29: LdTrue
	30: StLoc[9](loc0: bool)
B4:
	31: CopyLoc[0](Arg0: &mut TickManager)
	32: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	33: CopyLoc[12](loc3: u64)
	34: Call skip_list::contains<Tick>(&SkipList<Tick>, u64): bool
	35: Not
	36: BrFalse(45)
B5:
	37: CopyLoc[0](Arg0: &mut TickManager)
	38: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	39: CopyLoc[12](loc3: u64)
	40: MoveLoc[3](Arg3: I32)
	41: Call default(I32): Tick
	42: Call skip_list::insert<Tick>(&mut SkipList<Tick>, u64, Tick)
	43: LdTrue
	44: StLoc[10](loc1: bool)
B6:
	45: CopyLoc[0](Arg0: &mut TickManager)
	46: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	47: MoveLoc[11](loc2: u64)
	48: Call skip_list::borrow_mut<Tick>(&mut SkipList<Tick>, u64): &mut Tick
	49: CopyLoc[1](Arg1: I32)
	50: CopyLoc[4](Arg4: u128)
	51: MoveLoc[9](loc0: bool)
	52: LdTrue
	53: LdFalse
	54: CopyLoc[5](Arg5: u128)
	55: CopyLoc[6](Arg6: u128)
	56: CopyLoc[7](Arg7: u128)
	57: CopyLoc[8](Arg8: vector<u128>)
	58: Call update_by_liquidity(&mut Tick, I32, u128, bool, bool, bool, u128, u128, u128, vector<u128>): u128
	59: Pop
	60: MoveLoc[0](Arg0: &mut TickManager)
	61: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	62: MoveLoc[12](loc3: u64)
	63: Call skip_list::borrow_mut<Tick>(&mut SkipList<Tick>, u64): &mut Tick
	64: MoveLoc[1](Arg1: I32)
	65: MoveLoc[4](Arg4: u128)
	66: MoveLoc[10](loc1: bool)
	67: LdTrue
	68: LdTrue
	69: MoveLoc[5](Arg5: u128)
	70: MoveLoc[6](Arg6: u128)
	71: MoveLoc[7](Arg7: u128)
	72: MoveLoc[8](Arg8: vector<u128>)
	73: Call update_by_liquidity(&mut Tick, I32, u128, bool, bool, bool, u128, u128, u128, vector<u128>): u128
	74: Pop
	75: Ret
}

public(friend) decrease_liquidity(Arg0: &mut TickManager, Arg1: I32, Arg2: I32, Arg3: I32, Arg4: u128, Arg5: u128, Arg6: u128, Arg7: u128, Arg8: vector<u128>) {
L9:	loc0: u64
L10:	loc1: u64
B0:
	0: CopyLoc[4](Arg4: u128)
	1: LdU128(0)
	2: Eq
	3: BrFalse(7)
B1:
	4: MoveLoc[0](Arg0: &mut TickManager)
	5: Pop
	6: Ret
B2:
	7: MoveLoc[2](Arg2: I32)
	8: Call tick_score(I32): u64
	9: MoveLoc[3](Arg3: I32)
	10: Call tick_score(I32): u64
	11: StLoc[10](loc1: u64)
	12: StLoc[9](loc0: u64)
	13: CopyLoc[0](Arg0: &mut TickManager)
	14: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	15: CopyLoc[9](loc0: u64)
	16: Call skip_list::contains<Tick>(&SkipList<Tick>, u64): bool
	17: BrFalse(19)
B3:
	18: Branch(23)
B4:
	19: MoveLoc[0](Arg0: &mut TickManager)
	20: Pop
	21: LdConst[3](u64: 3)
	22: Abort
B5:
	23: CopyLoc[0](Arg0: &mut TickManager)
	24: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	25: CopyLoc[10](loc1: u64)
	26: Call skip_list::contains<Tick>(&SkipList<Tick>, u64): bool
	27: BrFalse(29)
B6:
	28: Branch(33)
B7:
	29: MoveLoc[0](Arg0: &mut TickManager)
	30: Pop
	31: LdConst[3](u64: 3)
	32: Abort
B8:
	33: CopyLoc[0](Arg0: &mut TickManager)
	34: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	35: CopyLoc[9](loc0: u64)
	36: Call skip_list::borrow_mut<Tick>(&mut SkipList<Tick>, u64): &mut Tick
	37: CopyLoc[1](Arg1: I32)
	38: CopyLoc[4](Arg4: u128)
	39: LdFalse
	40: LdFalse
	41: LdFalse
	42: CopyLoc[5](Arg5: u128)
	43: CopyLoc[6](Arg6: u128)
	44: CopyLoc[7](Arg7: u128)
	45: CopyLoc[8](Arg8: vector<u128>)
	46: Call update_by_liquidity(&mut Tick, I32, u128, bool, bool, bool, u128, u128, u128, vector<u128>): u128
	47: LdU128(0)
	48: Eq
	49: BrFalse(55)
B9:
	50: CopyLoc[0](Arg0: &mut TickManager)
	51: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	52: MoveLoc[9](loc0: u64)
	53: Call skip_list::remove<Tick>(&mut SkipList<Tick>, u64): Tick
	54: Pop
B10:
	55: CopyLoc[0](Arg0: &mut TickManager)
	56: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	57: CopyLoc[10](loc1: u64)
	58: Call skip_list::borrow_mut<Tick>(&mut SkipList<Tick>, u64): &mut Tick
	59: MoveLoc[1](Arg1: I32)
	60: MoveLoc[4](Arg4: u128)
	61: LdFalse
	62: LdFalse
	63: LdTrue
	64: MoveLoc[5](Arg5: u128)
	65: MoveLoc[6](Arg6: u128)
	66: MoveLoc[7](Arg7: u128)
	67: MoveLoc[8](Arg8: vector<u128>)
	68: Call update_by_liquidity(&mut Tick, I32, u128, bool, bool, bool, u128, u128, u128, vector<u128>): u128
	69: LdU128(0)
	70: Eq
	71: BrFalse(78)
B11:
	72: MoveLoc[0](Arg0: &mut TickManager)
	73: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	74: MoveLoc[10](loc1: u64)
	75: Call skip_list::remove<Tick>(&mut SkipList<Tick>, u64): Tick
	76: Pop
	77: Branch(80)
B12:
	78: MoveLoc[0](Arg0: &mut TickManager)
	79: Pop
B13:
	80: Ret
}

public first_score_for_swap(Arg0: &TickManager, Arg1: I32, Arg2: bool): OptionU64 {
L3:	loc0: OptionU64
L4:	loc1: OptionU64
L5:	loc2: u64
L6:	loc3: u64
L7:	loc4: u64
B0:
	0: MoveLoc[2](Arg2: bool)
	1: BrFalse(12)
B1:
	2: MoveLoc[1](Arg1: I32)
	3: Call tick_score(I32): u64
	4: StLoc[5](loc2: u64)
	5: MoveLoc[0](Arg0: &TickManager)
	6: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	7: MoveLoc[5](loc2: u64)
	8: LdTrue
	9: Call skip_list::find_prev<Tick>(&SkipList<Tick>, u64, bool): OptionU64
	10: StLoc[4](loc1: OptionU64)
	11: Branch(40)
B2:
	12: CopyLoc[1](Arg1: I32)
	13: Call tick_math::tick_bound(): u32
	14: LdU32(1)
	15: Add
	16: Call i32::neg_from(u32): I32
	17: Call i32::eq(I32, I32): bool
	18: BrFalse(29)
B3:
	19: Call tick_math::min_tick(): I32
	20: Call tick_score(I32): u64
	21: StLoc[6](loc3: u64)
	22: MoveLoc[0](Arg0: &TickManager)
	23: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	24: MoveLoc[6](loc3: u64)
	25: LdTrue
	26: Call skip_list::find_next<Tick>(&SkipList<Tick>, u64, bool): OptionU64
	27: StLoc[3](loc0: OptionU64)
	28: Branch(38)
B4:
	29: MoveLoc[1](Arg1: I32)
	30: Call tick_score(I32): u64
	31: StLoc[7](loc4: u64)
	32: MoveLoc[0](Arg0: &TickManager)
	33: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	34: MoveLoc[7](loc4: u64)
	35: LdFalse
	36: Call skip_list::find_next<Tick>(&SkipList<Tick>, u64, bool): OptionU64
	37: StLoc[3](loc0: OptionU64)
B5:
	38: MoveLoc[3](loc0: OptionU64)
	39: StLoc[4](loc1: OptionU64)
B6:
	40: MoveLoc[4](loc1: OptionU64)
	41: Ret
}

public borrow_tick_for_swap(Arg0: &TickManager, Arg1: u64, Arg2: bool): &Tick * OptionU64 {
L3:	loc0: OptionU64
L4:	loc1: &Node<Tick>
L5:	loc2: OptionU64
B0:
	0: MoveLoc[0](Arg0: &TickManager)
	1: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	2: MoveLoc[1](Arg1: u64)
	3: Call skip_list::borrow_node<Tick>(&SkipList<Tick>, u64): &Node<Tick>
	4: StLoc[4](loc1: &Node<Tick>)
	5: MoveLoc[2](Arg2: bool)
	6: BrFalse(11)
B1:
	7: CopyLoc[4](loc1: &Node<Tick>)
	8: Call skip_list::prev_score<Tick>(&Node<Tick>): OptionU64
	9: StLoc[3](loc0: OptionU64)
	10: Branch(14)
B2:
	11: CopyLoc[4](loc1: &Node<Tick>)
	12: Call skip_list::next_score<Tick>(&Node<Tick>): OptionU64
	13: StLoc[3](loc0: OptionU64)
B3:
	14: MoveLoc[3](loc0: OptionU64)
	15: StLoc[5](loc2: OptionU64)
	16: MoveLoc[4](loc1: &Node<Tick>)
	17: Call skip_list::borrow_value<Tick>(&Node<Tick>): &Tick
	18: MoveLoc[5](loc2: OptionU64)
	19: Ret
}

public(friend) try_borrow_tick(Arg0: &TickManager, Arg1: I32): Option<Tick> {
L2:	loc0: u64
B0:
	0: MoveLoc[1](Arg1: I32)
	1: Call tick_score(I32): u64
	2: StLoc[2](loc0: u64)
	3: CopyLoc[0](Arg0: &TickManager)
	4: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	5: CopyLoc[2](loc0: u64)
	6: Call skip_list::contains<Tick>(&SkipList<Tick>, u64): bool
	7: Not
	8: BrFalse(13)
B1:
	9: MoveLoc[0](Arg0: &TickManager)
	10: Pop
	11: Call option::none<Tick>(): Option<Tick>
	12: Ret
B2:
	13: MoveLoc[0](Arg0: &TickManager)
	14: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	15: MoveLoc[2](loc0: u64)
	16: Call skip_list::borrow<Tick>(&SkipList<Tick>, u64): &Tick
	17: ReadRef
	18: Call option::some<Tick>(Tick): Option<Tick>
	19: Ret
}

public tick_spacing(Arg0: &TickManager): u32 {
B0:
	0: MoveLoc[0](Arg0: &TickManager)
	1: ImmBorrowField[1](TickManager.tick_spacing: u32)
	2: ReadRef
	3: Ret
}

public index(Arg0: &Tick): I32 {
B0:
	0: MoveLoc[0](Arg0: &Tick)
	1: ImmBorrowField[2](Tick.index: I32)
	2: ReadRef
	3: Ret
}

public sqrt_price(Arg0: &Tick): u128 {
B0:
	0: MoveLoc[0](Arg0: &Tick)
	1: ImmBorrowField[3](Tick.sqrt_price: u128)
	2: ReadRef
	3: Ret
}

public liquidity_net(Arg0: &Tick): I128 {
B0:
	0: MoveLoc[0](Arg0: &Tick)
	1: ImmBorrowField[4](Tick.liquidity_net: I128)
	2: ReadRef
	3: Ret
}

public liquidity_gross(Arg0: &Tick): u128 {
B0:
	0: MoveLoc[0](Arg0: &Tick)
	1: ImmBorrowField[5](Tick.liquidity_gross: u128)
	2: ReadRef
	3: Ret
}

public fee_growth_outside(Arg0: &Tick): u128 * u128 {
B0:
	0: CopyLoc[0](Arg0: &Tick)
	1: ImmBorrowField[6](Tick.fee_growth_outside_a: u128)
	2: ReadRef
	3: MoveLoc[0](Arg0: &Tick)
	4: ImmBorrowField[7](Tick.fee_growth_outside_b: u128)
	5: ReadRef
	6: Ret
}

public points_growth_outside(Arg0: &Tick): u128 {
B0:
	0: MoveLoc[0](Arg0: &Tick)
	1: ImmBorrowField[8](Tick.points_growth_outside: u128)
	2: ReadRef
	3: Ret
}

public rewards_growth_outside(Arg0: &Tick): &vector<u128> {
B0:
	0: MoveLoc[0](Arg0: &Tick)
	1: ImmBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	2: Ret
}

public borrow_tick(Arg0: &TickManager, Arg1: I32): &Tick {
B0:
	0: MoveLoc[0](Arg0: &TickManager)
	1: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	2: MoveLoc[1](Arg1: I32)
	3: Call tick_score(I32): u64
	4: Call skip_list::borrow<Tick>(&SkipList<Tick>, u64): &Tick
	5: Ret
}

public get_reward_growth_outside(Arg0: &Tick, Arg1: u64): u128 {
L2:	loc0: u128
B0:
	0: CopyLoc[0](Arg0: &Tick)
	1: ImmBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	2: VecLen(14)
	3: CopyLoc[1](Arg1: u64)
	4: Le
	5: BrFalse(11)
B1:
	6: MoveLoc[0](Arg0: &Tick)
	7: Pop
	8: LdU128(0)
	9: StLoc[2](loc0: u128)
	10: Branch(17)
B2:
	11: MoveLoc[0](Arg0: &Tick)
	12: ImmBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	13: MoveLoc[1](Arg1: u64)
	14: VecImmBorrow(14)
	15: ReadRef
	16: StLoc[2](loc0: u128)
B3:
	17: MoveLoc[2](loc0: u128)
	18: Ret
}

public get_fee_in_range(Arg0: I32, Arg1: u128, Arg2: u128, Arg3: Option<Tick>, Arg4: Option<Tick>): u128 * u128 {
L5:	loc0: u128
L6:	loc1: u128
L7:	loc2: u128
L8:	loc3: u128
L9:	loc4: u128
L10:	loc5: u128
L11:	loc6: u128
L12:	loc7: u128
L13:	loc8: I32
L14:	loc9: u128
L15:	loc10: u128
L16:	loc11: u128
L17:	loc12: u128
L18:	loc13: &Tick
L19:	loc14: &Tick
B0:
	0: MoveLoc[0](Arg0: I32)
	1: StLoc[13](loc8: I32)
	2: ImmBorrowLoc[3](Arg3: Option<Tick>)
	3: Call option::is_none<Tick>(&Option<Tick>): bool
	4: BrFalse(10)
B1:
	5: CopyLoc[1](Arg1: u128)
	6: CopyLoc[2](Arg2: u128)
	7: StLoc[8](loc3: u128)
	8: StLoc[7](loc2: u128)
	9: Branch(44)
B2:
	10: ImmBorrowLoc[3](Arg3: Option<Tick>)
	11: Call option::borrow<Tick>(&Option<Tick>): &Tick
	12: StLoc[18](loc13: &Tick)
	13: CopyLoc[13](loc8: I32)
	14: CopyLoc[18](loc13: &Tick)
	15: ImmBorrowField[2](Tick.index: I32)
	16: ReadRef
	17: Call i32::lt(I32, I32): bool
	18: BrFalse(32)
B3:
	19: CopyLoc[1](Arg1: u128)
	20: CopyLoc[18](loc13: &Tick)
	21: ImmBorrowField[6](Tick.fee_growth_outside_a: u128)
	22: ReadRef
	23: Call math_u128::wrapping_sub(u128, u128): u128
	24: CopyLoc[2](Arg2: u128)
	25: MoveLoc[18](loc13: &Tick)
	26: ImmBorrowField[7](Tick.fee_growth_outside_b: u128)
	27: ReadRef
	28: Call math_u128::wrapping_sub(u128, u128): u128
	29: StLoc[6](loc1: u128)
	30: StLoc[5](loc0: u128)
	31: Branch(40)
B4:
	32: CopyLoc[18](loc13: &Tick)
	33: ImmBorrowField[6](Tick.fee_growth_outside_a: u128)
	34: ReadRef
	35: MoveLoc[18](loc13: &Tick)
	36: ImmBorrowField[7](Tick.fee_growth_outside_b: u128)
	37: ReadRef
	38: StLoc[6](loc1: u128)
	39: StLoc[5](loc0: u128)
B5:
	40: MoveLoc[5](loc0: u128)
	41: MoveLoc[6](loc1: u128)
	42: StLoc[8](loc3: u128)
	43: StLoc[7](loc2: u128)
B6:
	44: MoveLoc[7](loc2: u128)
	45: MoveLoc[8](loc3: u128)
	46: StLoc[17](loc12: u128)
	47: StLoc[16](loc11: u128)
	48: ImmBorrowLoc[4](Arg4: Option<Tick>)
	49: Call option::is_none<Tick>(&Option<Tick>): bool
	50: BrFalse(56)
B7:
	51: LdU128(0)
	52: LdU128(0)
	53: StLoc[12](loc7: u128)
	54: StLoc[11](loc6: u128)
	55: Branch(90)
B8:
	56: ImmBorrowLoc[4](Arg4: Option<Tick>)
	57: Call option::borrow<Tick>(&Option<Tick>): &Tick
	58: StLoc[19](loc14: &Tick)
	59: MoveLoc[13](loc8: I32)
	60: CopyLoc[19](loc14: &Tick)
	61: ImmBorrowField[2](Tick.index: I32)
	62: ReadRef
	63: Call i32::lt(I32, I32): bool
	64: BrFalse(74)
B9:
	65: CopyLoc[19](loc14: &Tick)
	66: ImmBorrowField[6](Tick.fee_growth_outside_a: u128)
	67: ReadRef
	68: MoveLoc[19](loc14: &Tick)
	69: ImmBorrowField[7](Tick.fee_growth_outside_b: u128)
	70: ReadRef
	71: StLoc[10](loc5: u128)
	72: StLoc[9](loc4: u128)
	73: Branch(86)
B10:
	74: CopyLoc[1](Arg1: u128)
	75: CopyLoc[19](loc14: &Tick)
	76: ImmBorrowField[6](Tick.fee_growth_outside_a: u128)
	77: ReadRef
	78: Call math_u128::wrapping_sub(u128, u128): u128
	79: CopyLoc[2](Arg2: u128)
	80: MoveLoc[19](loc14: &Tick)
	81: ImmBorrowField[7](Tick.fee_growth_outside_b: u128)
	82: ReadRef
	83: Call math_u128::wrapping_sub(u128, u128): u128
	84: StLoc[10](loc5: u128)
	85: StLoc[9](loc4: u128)
B11:
	86: MoveLoc[9](loc4: u128)
	87: MoveLoc[10](loc5: u128)
	88: StLoc[12](loc7: u128)
	89: StLoc[11](loc6: u128)
B12:
	90: MoveLoc[11](loc6: u128)
	91: MoveLoc[12](loc7: u128)
	92: StLoc[15](loc10: u128)
	93: StLoc[14](loc9: u128)
	94: MoveLoc[1](Arg1: u128)
	95: MoveLoc[16](loc11: u128)
	96: Call math_u128::wrapping_sub(u128, u128): u128
	97: MoveLoc[14](loc9: u128)
	98: Call math_u128::wrapping_sub(u128, u128): u128
	99: MoveLoc[2](Arg2: u128)
	100: MoveLoc[17](loc12: u128)
	101: Call math_u128::wrapping_sub(u128, u128): u128
	102: MoveLoc[15](loc10: u128)
	103: Call math_u128::wrapping_sub(u128, u128): u128
	104: Ret
}

public get_rewards_in_range(Arg0: I32, Arg1: vector<u128>, Arg2: Option<Tick>, Arg3: Option<Tick>): vector<u128> {
L4:	loc0: u128
L5:	loc1: u128
L6:	loc2: u128
L7:	loc3: u128
L8:	loc4: u128
L9:	loc5: u64
L10:	loc6: u128
L11:	loc7: u128
L12:	loc8: u128
L13:	loc9: vector<u128>
L14:	loc10: &Tick
L15:	loc11: &Tick
B0:
	0: VecPack(14, 0)
	1: StLoc[13](loc9: vector<u128>)
	2: LdU64(0)
	3: StLoc[9](loc5: u64)
B1:
	4: CopyLoc[9](loc5: u64)
	5: ImmBorrowLoc[1](Arg1: vector<u128>)
	6: VecLen(14)
	7: Lt
	8: BrFalse(89)
B2:
	9: Branch(10)
B3:
	10: ImmBorrowLoc[1](Arg1: vector<u128>)
	11: CopyLoc[9](loc5: u64)
	12: VecImmBorrow(14)
	13: ReadRef
	14: StLoc[8](loc4: u128)
	15: ImmBorrowLoc[2](Arg2: Option<Tick>)
	16: Call option::is_none<Tick>(&Option<Tick>): bool
	17: BrFalse(21)
B4:
	18: CopyLoc[8](loc4: u128)
	19: StLoc[5](loc1: u128)
	20: Branch(43)
B5:
	21: ImmBorrowLoc[2](Arg2: Option<Tick>)
	22: Call option::borrow<Tick>(&Option<Tick>): &Tick
	23: StLoc[14](loc10: &Tick)
	24: CopyLoc[0](Arg0: I32)
	25: CopyLoc[14](loc10: &Tick)
	26: ImmBorrowField[2](Tick.index: I32)
	27: ReadRef
	28: Call i32::lt(I32, I32): bool
	29: BrFalse(37)
B6:
	30: CopyLoc[8](loc4: u128)
	31: MoveLoc[14](loc10: &Tick)
	32: CopyLoc[9](loc5: u64)
	33: Call get_reward_growth_outside(&Tick, u64): u128
	34: Call math_u128::wrapping_sub(u128, u128): u128
	35: StLoc[4](loc0: u128)
	36: Branch(41)
B7:
	37: MoveLoc[14](loc10: &Tick)
	38: CopyLoc[9](loc5: u64)
	39: Call get_reward_growth_outside(&Tick, u64): u128
	40: StLoc[4](loc0: u128)
B8:
	41: MoveLoc[4](loc0: u128)
	42: StLoc[5](loc1: u128)
B9:
	43: MoveLoc[5](loc1: u128)
	44: StLoc[10](loc6: u128)
	45: ImmBorrowLoc[3](Arg3: Option<Tick>)
	46: Call option::is_none<Tick>(&Option<Tick>): bool
	47: BrFalse(51)
B10:
	48: LdU128(0)
	49: StLoc[7](loc3: u128)
	50: Branch(73)
B11:
	51: ImmBorrowLoc[3](Arg3: Option<Tick>)
	52: Call option::borrow<Tick>(&Option<Tick>): &Tick
	53: StLoc[15](loc11: &Tick)
	54: CopyLoc[0](Arg0: I32)
	55: CopyLoc[15](loc11: &Tick)
	56: ImmBorrowField[2](Tick.index: I32)
	57: ReadRef
	58: Call i32::lt(I32, I32): bool
	59: BrFalse(65)
B12:
	60: MoveLoc[15](loc11: &Tick)
	61: CopyLoc[9](loc5: u64)
	62: Call get_reward_growth_outside(&Tick, u64): u128
	63: StLoc[6](loc2: u128)
	64: Branch(71)
B13:
	65: CopyLoc[8](loc4: u128)
	66: MoveLoc[15](loc11: &Tick)
	67: CopyLoc[9](loc5: u64)
	68: Call get_reward_growth_outside(&Tick, u64): u128
	69: Call math_u128::wrapping_sub(u128, u128): u128
	70: StLoc[6](loc2: u128)
B14:
	71: MoveLoc[6](loc2: u128)
	72: StLoc[7](loc3: u128)
B15:
	73: MoveLoc[7](loc3: u128)
	74: StLoc[11](loc7: u128)
	75: MoveLoc[8](loc4: u128)
	76: MoveLoc[10](loc6: u128)
	77: Call math_u128::wrapping_sub(u128, u128): u128
	78: MoveLoc[11](loc7: u128)
	79: Call math_u128::wrapping_sub(u128, u128): u128
	80: StLoc[12](loc8: u128)
	81: MutBorrowLoc[13](loc9: vector<u128>)
	82: MoveLoc[12](loc8: u128)
	83: VecPushBack(14)
	84: MoveLoc[9](loc5: u64)
	85: LdU64(1)
	86: Add
	87: StLoc[9](loc5: u64)
	88: Branch(4)
B16:
	89: MoveLoc[13](loc9: vector<u128>)
	90: Ret
}

public get_points_in_range(Arg0: I32, Arg1: u128, Arg2: Option<Tick>, Arg3: Option<Tick>): u128 {
L4:	loc0: u128
L5:	loc1: u128
L6:	loc2: u128
L7:	loc3: u128
L8:	loc4: u128
L9:	loc5: u128
L10:	loc6: &Tick
L11:	loc7: &Tick
B0:
	0: ImmBorrowLoc[2](Arg2: Option<Tick>)
	1: Call option::is_none<Tick>(&Option<Tick>): bool
	2: BrFalse(6)
B1:
	3: CopyLoc[1](Arg1: u128)
	4: StLoc[5](loc1: u128)
	5: Branch(28)
B2:
	6: ImmBorrowLoc[2](Arg2: Option<Tick>)
	7: Call option::borrow<Tick>(&Option<Tick>): &Tick
	8: StLoc[10](loc6: &Tick)
	9: CopyLoc[0](Arg0: I32)
	10: CopyLoc[10](loc6: &Tick)
	11: ImmBorrowField[2](Tick.index: I32)
	12: ReadRef
	13: Call i32::lt(I32, I32): bool
	14: BrFalse(22)
B3:
	15: CopyLoc[1](Arg1: u128)
	16: MoveLoc[10](loc6: &Tick)
	17: ImmBorrowField[8](Tick.points_growth_outside: u128)
	18: ReadRef
	19: Call math_u128::wrapping_sub(u128, u128): u128
	20: StLoc[4](loc0: u128)
	21: Branch(26)
B4:
	22: MoveLoc[10](loc6: &Tick)
	23: ImmBorrowField[8](Tick.points_growth_outside: u128)
	24: ReadRef
	25: StLoc[4](loc0: u128)
B5:
	26: MoveLoc[4](loc0: u128)
	27: StLoc[5](loc1: u128)
B6:
	28: MoveLoc[5](loc1: u128)
	29: StLoc[9](loc5: u128)
	30: ImmBorrowLoc[3](Arg3: Option<Tick>)
	31: Call option::is_none<Tick>(&Option<Tick>): bool
	32: BrFalse(36)
B7:
	33: LdU128(0)
	34: StLoc[7](loc3: u128)
	35: Branch(58)
B8:
	36: ImmBorrowLoc[3](Arg3: Option<Tick>)
	37: Call option::borrow<Tick>(&Option<Tick>): &Tick
	38: StLoc[11](loc7: &Tick)
	39: MoveLoc[0](Arg0: I32)
	40: CopyLoc[11](loc7: &Tick)
	41: ImmBorrowField[2](Tick.index: I32)
	42: ReadRef
	43: Call i32::lt(I32, I32): bool
	44: BrFalse(50)
B9:
	45: MoveLoc[11](loc7: &Tick)
	46: ImmBorrowField[8](Tick.points_growth_outside: u128)
	47: ReadRef
	48: StLoc[6](loc2: u128)
	49: Branch(56)
B10:
	50: CopyLoc[1](Arg1: u128)
	51: MoveLoc[11](loc7: &Tick)
	52: ImmBorrowField[8](Tick.points_growth_outside: u128)
	53: ReadRef
	54: Call math_u128::wrapping_sub(u128, u128): u128
	55: StLoc[6](loc2: u128)
B11:
	56: MoveLoc[6](loc2: u128)
	57: StLoc[7](loc3: u128)
B12:
	58: MoveLoc[7](loc3: u128)
	59: StLoc[8](loc4: u128)
	60: MoveLoc[1](Arg1: u128)
	61: MoveLoc[9](loc5: u128)
	62: Call math_u128::wrapping_sub(u128, u128): u128
	63: MoveLoc[8](loc4: u128)
	64: Call math_u128::wrapping_sub(u128, u128): u128
	65: Ret
}

public(friend) cross_by_swap(Arg0: &mut TickManager, Arg1: I32, Arg2: bool, Arg3: u128, Arg4: u128, Arg5: u128, Arg6: u128, Arg7: vector<u128>): u128 {
L8:	loc0: I128
L9:	loc1: u128
L10:	loc2: u128
L11:	loc3: u128
L12:	loc4: u64
L13:	loc5: u64
L14:	loc6: I128
L15:	loc7: u128
L16:	loc8: u128
L17:	loc9: u128
L18:	loc10: u64
L19:	loc11: &mut Tick
B0:
	0: MoveLoc[0](Arg0: &mut TickManager)
	1: MutBorrowField[0](TickManager.ticks: SkipList<Tick>)
	2: MoveLoc[1](Arg1: I32)
	3: Call tick_score(I32): u64
	4: Call skip_list::borrow_mut<Tick>(&mut SkipList<Tick>, u64): &mut Tick
	5: StLoc[19](loc11: &mut Tick)
	6: MoveLoc[2](Arg2: bool)
	7: BrFalse(14)
B1:
	8: CopyLoc[19](loc11: &mut Tick)
	9: ImmBorrowField[4](Tick.liquidity_net: I128)
	10: ReadRef
	11: Call i128::neg(I128): I128
	12: StLoc[8](loc0: I128)
	13: Branch(18)
B2:
	14: CopyLoc[19](loc11: &mut Tick)
	15: ImmBorrowField[4](Tick.liquidity_net: I128)
	16: ReadRef
	17: StLoc[8](loc0: I128)
B3:
	18: MoveLoc[8](loc0: I128)
	19: StLoc[14](loc6: I128)
	20: CopyLoc[14](loc6: I128)
	21: Call i128::is_neg(I128): bool
	22: Not
	23: BrFalse(41)
B4:
	24: MoveLoc[14](loc6: I128)
	25: Call i128::abs_u128(I128): u128
	26: StLoc[15](loc7: u128)
	27: CopyLoc[15](loc7: u128)
	28: CopyLoc[3](Arg3: u128)
	29: Call math_u128::add_check(u128, u128): bool
	30: BrFalse(32)
B5:
	31: Branch(36)
B6:
	32: MoveLoc[19](loc11: &mut Tick)
	33: Pop
	34: LdConst[1](u64: 1)
	35: Abort
B7:
	36: MoveLoc[3](Arg3: u128)
	37: MoveLoc[15](loc7: u128)
	38: Add
	39: StLoc[9](loc1: u128)
	40: Branch(57)
B8:
	41: MoveLoc[14](loc6: I128)
	42: Call i128::abs_u128(I128): u128
	43: StLoc[16](loc8: u128)
	44: CopyLoc[3](Arg3: u128)
	45: CopyLoc[16](loc8: u128)
	46: Ge
	47: BrFalse(49)
B9:
	48: Branch(53)
B10:
	49: MoveLoc[19](loc11: &mut Tick)
	50: Pop
	51: LdConst[1](u64: 1)
	52: Abort
B11:
	53: MoveLoc[3](Arg3: u128)
	54: MoveLoc[16](loc8: u128)
	55: Sub
	56: StLoc[9](loc1: u128)
B12:
	57: MoveLoc[9](loc1: u128)
	58: StLoc[10](loc2: u128)
	59: MoveLoc[4](Arg4: u128)
	60: CopyLoc[19](loc11: &mut Tick)
	61: ImmBorrowField[6](Tick.fee_growth_outside_a: u128)
	62: ReadRef
	63: Call math_u128::wrapping_sub(u128, u128): u128
	64: CopyLoc[19](loc11: &mut Tick)
	65: MutBorrowField[6](Tick.fee_growth_outside_a: u128)
	66: WriteRef
	67: MoveLoc[5](Arg5: u128)
	68: CopyLoc[19](loc11: &mut Tick)
	69: ImmBorrowField[7](Tick.fee_growth_outside_b: u128)
	70: ReadRef
	71: Call math_u128::wrapping_sub(u128, u128): u128
	72: CopyLoc[19](loc11: &mut Tick)
	73: MutBorrowField[7](Tick.fee_growth_outside_b: u128)
	74: WriteRef
	75: ImmBorrowLoc[7](Arg7: vector<u128>)
	76: VecLen(14)
	77: StLoc[18](loc10: u64)
	78: CopyLoc[18](loc10: u64)
	79: LdU64(0)
	80: Gt
	81: BrFalse(126)
B13:
	82: CopyLoc[19](loc11: &mut Tick)
	83: ImmBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	84: VecLen(14)
	85: StLoc[13](loc5: u64)
	86: LdU64(0)
	87: StLoc[12](loc4: u64)
B14:
	88: CopyLoc[12](loc4: u64)
	89: CopyLoc[18](loc10: u64)
	90: Lt
	91: BrFalse(126)
B15:
	92: Branch(93)
B16:
	93: ImmBorrowLoc[7](Arg7: vector<u128>)
	94: CopyLoc[12](loc4: u64)
	95: VecImmBorrow(14)
	96: ReadRef
	97: StLoc[11](loc3: u128)
	98: CopyLoc[13](loc5: u64)
	99: CopyLoc[12](loc4: u64)
	100: Gt
	101: BrFalse(117)
B17:
	102: CopyLoc[19](loc11: &mut Tick)
	103: ImmBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	104: CopyLoc[12](loc4: u64)
	105: VecImmBorrow(14)
	106: ReadRef
	107: StLoc[17](loc9: u128)
	108: MoveLoc[11](loc3: u128)
	109: MoveLoc[17](loc9: u128)
	110: Call math_u128::wrapping_sub(u128, u128): u128
	111: CopyLoc[19](loc11: &mut Tick)
	112: MutBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	113: CopyLoc[12](loc4: u64)
	114: VecMutBorrow(14)
	115: WriteRef
	116: Branch(121)
B18:
	117: CopyLoc[19](loc11: &mut Tick)
	118: MutBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	119: MoveLoc[11](loc3: u128)
	120: VecPushBack(14)
B19:
	121: MoveLoc[12](loc4: u64)
	122: LdU64(1)
	123: Add
	124: StLoc[12](loc4: u64)
	125: Branch(88)
B20:
	126: MoveLoc[6](Arg6: u128)
	127: CopyLoc[19](loc11: &mut Tick)
	128: ImmBorrowField[8](Tick.points_growth_outside: u128)
	129: ReadRef
	130: Call math_u128::wrapping_sub(u128, u128): u128
	131: MoveLoc[19](loc11: &mut Tick)
	132: MutBorrowField[8](Tick.points_growth_outside: u128)
	133: WriteRef
	134: MoveLoc[10](loc2: u128)
	135: Ret
}

public fetch_ticks(Arg0: &TickManager, Arg1: vector<u32>, Arg2: u64): vector<Tick> {
L3:	loc0: OptionU64
L4:	loc1: u64
L5:	loc2: &Node<Tick>
L6:	loc3: OptionU64
L7:	loc4: u64
L8:	loc5: vector<Tick>
B0:
	0: VecPack(28, 0)
	1: StLoc[8](loc5: vector<Tick>)
	2: ImmBorrowLoc[1](Arg1: vector<u32>)
	3: Call vector::is_empty<u32>(&vector<u32>): bool
	4: BrFalse(10)
B1:
	5: CopyLoc[0](Arg0: &TickManager)
	6: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	7: Call skip_list::head<Tick>(&SkipList<Tick>): OptionU64
	8: StLoc[3](loc0: OptionU64)
	9: Branch(23)
B2:
	10: ImmBorrowLoc[1](Arg1: vector<u32>)
	11: LdU64(0)
	12: VecImmBorrow(11)
	13: ReadRef
	14: Call i32::from_u32(u32): I32
	15: Call tick_score(I32): u64
	16: StLoc[7](loc4: u64)
	17: CopyLoc[0](Arg0: &TickManager)
	18: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	19: MoveLoc[7](loc4: u64)
	20: LdTrue
	21: Call skip_list::find_next<Tick>(&SkipList<Tick>, u64, bool): OptionU64
	22: StLoc[3](loc0: OptionU64)
B3:
	23: MoveLoc[3](loc0: OptionU64)
	24: StLoc[6](loc3: OptionU64)
	25: LdU64(0)
	26: StLoc[4](loc1: u64)
B4:
	27: ImmBorrowLoc[6](loc3: OptionU64)
	28: Call option_u64::is_some(&OptionU64): bool
	29: BrFalse(57)
B5:
	30: Branch(31)
B6:
	31: CopyLoc[0](Arg0: &TickManager)
	32: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	33: ImmBorrowLoc[6](loc3: OptionU64)
	34: Call option_u64::borrow(&OptionU64): u64
	35: Call skip_list::borrow_node<Tick>(&SkipList<Tick>, u64): &Node<Tick>
	36: StLoc[5](loc2: &Node<Tick>)
	37: MutBorrowLoc[8](loc5: vector<Tick>)
	38: CopyLoc[5](loc2: &Node<Tick>)
	39: Call skip_list::borrow_value<Tick>(&Node<Tick>): &Tick
	40: ReadRef
	41: VecPushBack(28)
	42: MoveLoc[5](loc2: &Node<Tick>)
	43: Call skip_list::next_score<Tick>(&Node<Tick>): OptionU64
	44: StLoc[6](loc3: OptionU64)
	45: MoveLoc[4](loc1: u64)
	46: LdU64(1)
	47: Add
	48: StLoc[4](loc1: u64)
	49: CopyLoc[4](loc1: u64)
	50: CopyLoc[2](Arg2: u64)
	51: Eq
	52: BrFalse(56)
B7:
	53: MoveLoc[0](Arg0: &TickManager)
	54: Pop
	55: Branch(57)
B8:
	56: Branch(27)
B9:
	57: MoveLoc[8](loc5: vector<Tick>)
	58: Ret
}

public tick_count(Arg0: &TickManager): u64 {
B0:
	0: MoveLoc[0](Arg0: &TickManager)
	1: ImmBorrowField[0](TickManager.ticks: SkipList<Tick>)
	2: Call skip_list::length<Tick>(&SkipList<Tick>): u64
	3: Ret
}

update_by_liquidity(Arg0: &mut Tick, Arg1: I32, Arg2: u128, Arg3: bool, Arg4: bool, Arg5: bool, Arg6: u128, Arg7: u128, Arg8: u128, Arg9: vector<u128>): u128 {
L10:	loc0: u128
L11:	loc1: I128
L12:	loc2: bool
L13:	loc3: I128
L14:	loc4: bool
L15:	loc5: I128
L16:	loc6: bool
L17:	loc7: u128
L18:	loc8: u128
L19:	loc9: vector<u128>
L20:	loc10: u128
L21:	loc11: u128
L22:	loc12: u128
L23:	loc13: vector<u128>
L24:	loc14: u128
L25:	loc15: u128
L26:	loc16: u128
L27:	loc17: u128
L28:	loc18: I128
L29:	loc19: bool
L30:	loc20: u128
L31:	loc21: vector<u128>
B0:
	0: CopyLoc[4](Arg4: bool)
	1: BrFalse(20)
B1:
	2: CopyLoc[0](Arg0: &mut Tick)
	3: ImmBorrowField[5](Tick.liquidity_gross: u128)
	4: ReadRef
	5: CopyLoc[2](Arg2: u128)
	6: Call math_u128::add_check(u128, u128): bool
	7: BrFalse(9)
B2:
	8: Branch(13)
B3:
	9: MoveLoc[0](Arg0: &mut Tick)
	10: Pop
	11: LdConst[0](u64: 0)
	12: Abort
B4:
	13: CopyLoc[0](Arg0: &mut Tick)
	14: ImmBorrowField[5](Tick.liquidity_gross: u128)
	15: ReadRef
	16: CopyLoc[2](Arg2: u128)
	17: Add
	18: StLoc[10](loc0: u128)
	19: Branch(37)
B5:
	20: CopyLoc[0](Arg0: &mut Tick)
	21: ImmBorrowField[5](Tick.liquidity_gross: u128)
	22: ReadRef
	23: CopyLoc[2](Arg2: u128)
	24: Ge
	25: BrFalse(27)
B6:
	26: Branch(31)
B7:
	27: MoveLoc[0](Arg0: &mut Tick)
	28: Pop
	29: LdConst[1](u64: 1)
	30: Abort
B8:
	31: CopyLoc[0](Arg0: &mut Tick)
	32: ImmBorrowField[5](Tick.liquidity_gross: u128)
	33: ReadRef
	34: CopyLoc[2](Arg2: u128)
	35: Sub
	36: StLoc[10](loc0: u128)
B9:
	37: MoveLoc[10](loc0: u128)
	38: StLoc[27](loc17: u128)
	39: CopyLoc[27](loc17: u128)
	40: LdU128(0)
	41: Eq
	42: BrFalse(47)
B10:
	43: MoveLoc[0](Arg0: &mut Tick)
	44: Pop
	45: MoveLoc[27](loc17: u128)
	46: Ret
B11:
	47: MoveLoc[3](Arg3: bool)
	48: BrFalse(83)
B12:
	49: MoveLoc[1](Arg1: I32)
	50: CopyLoc[0](Arg0: &mut Tick)
	51: ImmBorrowField[2](Tick.index: I32)
	52: ReadRef
	53: Call i32::lt(I32, I32): bool
	54: BrFalse(66)
B13:
	55: LdU128(0)
	56: LdU128(0)
	57: ImmBorrowLoc[9](Arg9: vector<u128>)
	58: VecLen(14)
	59: Call default_rewards_growth_outside(u64): vector<u128>
	60: LdU128(0)
	61: StLoc[20](loc10: u128)
	62: StLoc[19](loc9: vector<u128>)
	63: StLoc[18](loc8: u128)
	64: StLoc[17](loc7: u128)
	65: Branch(74)
B14:
	66: MoveLoc[6](Arg6: u128)
	67: MoveLoc[7](Arg7: u128)
	68: MoveLoc[9](Arg9: vector<u128>)
	69: MoveLoc[8](Arg8: u128)
	70: StLoc[20](loc10: u128)
	71: StLoc[19](loc9: vector<u128>)
	72: StLoc[18](loc8: u128)
	73: StLoc[17](loc7: u128)
B15:
	74: MoveLoc[17](loc7: u128)
	75: MoveLoc[18](loc8: u128)
	76: MoveLoc[19](loc9: vector<u128>)
	77: MoveLoc[20](loc10: u128)
	78: StLoc[24](loc14: u128)
	79: StLoc[23](loc13: vector<u128>)
	80: StLoc[22](loc12: u128)
	81: StLoc[21](loc11: u128)
	82: Branch(99)
B16:
	83: CopyLoc[0](Arg0: &mut Tick)
	84: ImmBorrowField[6](Tick.fee_growth_outside_a: u128)
	85: ReadRef
	86: CopyLoc[0](Arg0: &mut Tick)
	87: ImmBorrowField[7](Tick.fee_growth_outside_b: u128)
	88: ReadRef
	89: CopyLoc[0](Arg0: &mut Tick)
	90: ImmBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	91: ReadRef
	92: CopyLoc[0](Arg0: &mut Tick)
	93: ImmBorrowField[8](Tick.points_growth_outside: u128)
	94: ReadRef
	95: StLoc[24](loc14: u128)
	96: StLoc[23](loc13: vector<u128>)
	97: StLoc[22](loc12: u128)
	98: StLoc[21](loc11: u128)
B17:
	99: MoveLoc[21](loc11: u128)
	100: MoveLoc[22](loc12: u128)
	101: MoveLoc[23](loc13: vector<u128>)
	102: MoveLoc[24](loc14: u128)
	103: StLoc[30](loc20: u128)
	104: StLoc[31](loc21: vector<u128>)
	105: StLoc[26](loc16: u128)
	106: StLoc[25](loc15: u128)
	107: MoveLoc[4](Arg4: bool)
	108: BrFalse(133)
B18:
	109: MoveLoc[5](Arg5: bool)
	110: BrFalse(120)
B19:
	111: CopyLoc[0](Arg0: &mut Tick)
	112: ImmBorrowField[4](Tick.liquidity_net: I128)
	113: ReadRef
	114: MoveLoc[2](Arg2: u128)
	115: Call i128::from(u128): I128
	116: Call i128::overflowing_sub(I128, I128): I128 * bool
	117: StLoc[12](loc2: bool)
	118: StLoc[11](loc1: I128)
	119: Branch(128)
B20:
	120: CopyLoc[0](Arg0: &mut Tick)
	121: ImmBorrowField[4](Tick.liquidity_net: I128)
	122: ReadRef
	123: MoveLoc[2](Arg2: u128)
	124: Call i128::from(u128): I128
	125: Call i128::overflowing_add(I128, I128): I128 * bool
	126: StLoc[12](loc2: bool)
	127: StLoc[11](loc1: I128)
B21:
	128: MoveLoc[11](loc1: I128)
	129: MoveLoc[12](loc2: bool)
	130: StLoc[16](loc6: bool)
	131: StLoc[15](loc5: I128)
	132: Branch(156)
B22:
	133: MoveLoc[5](Arg5: bool)
	134: BrFalse(144)
B23:
	135: CopyLoc[0](Arg0: &mut Tick)
	136: ImmBorrowField[4](Tick.liquidity_net: I128)
	137: ReadRef
	138: MoveLoc[2](Arg2: u128)
	139: Call i128::from(u128): I128
	140: Call i128::overflowing_add(I128, I128): I128 * bool
	141: StLoc[14](loc4: bool)
	142: StLoc[13](loc3: I128)
	143: Branch(152)
B24:
	144: CopyLoc[0](Arg0: &mut Tick)
	145: ImmBorrowField[4](Tick.liquidity_net: I128)
	146: ReadRef
	147: MoveLoc[2](Arg2: u128)
	148: Call i128::from(u128): I128
	149: Call i128::overflowing_sub(I128, I128): I128 * bool
	150: StLoc[14](loc4: bool)
	151: StLoc[13](loc3: I128)
B25:
	152: MoveLoc[13](loc3: I128)
	153: MoveLoc[14](loc4: bool)
	154: StLoc[16](loc6: bool)
	155: StLoc[15](loc5: I128)
B26:
	156: MoveLoc[15](loc5: I128)
	157: MoveLoc[16](loc6: bool)
	158: StLoc[29](loc19: bool)
	159: StLoc[28](loc18: I128)
	160: MoveLoc[29](loc19: bool)
	161: BrFalse(166)
B27:
	162: MoveLoc[0](Arg0: &mut Tick)
	163: Pop
	164: LdConst[0](u64: 0)
	165: Abort
B28:
	166: CopyLoc[27](loc17: u128)
	167: CopyLoc[0](Arg0: &mut Tick)
	168: MutBorrowField[5](Tick.liquidity_gross: u128)
	169: WriteRef
	170: MoveLoc[28](loc18: I128)
	171: CopyLoc[0](Arg0: &mut Tick)
	172: MutBorrowField[4](Tick.liquidity_net: I128)
	173: WriteRef
	174: MoveLoc[25](loc15: u128)
	175: CopyLoc[0](Arg0: &mut Tick)
	176: MutBorrowField[6](Tick.fee_growth_outside_a: u128)
	177: WriteRef
	178: MoveLoc[26](loc16: u128)
	179: CopyLoc[0](Arg0: &mut Tick)
	180: MutBorrowField[7](Tick.fee_growth_outside_b: u128)
	181: WriteRef
	182: MoveLoc[31](loc21: vector<u128>)
	183: CopyLoc[0](Arg0: &mut Tick)
	184: MutBorrowField[9](Tick.rewards_growth_outside: vector<u128>)
	185: WriteRef
	186: MoveLoc[30](loc20: u128)
	187: MoveLoc[0](Arg0: &mut Tick)
	188: MutBorrowField[8](Tick.points_growth_outside: u128)
	189: WriteRef
	190: MoveLoc[27](loc17: u128)
	191: Ret
}

default(Arg0: I32): Tick {
B0:
	0: CopyLoc[0](Arg0: I32)
	1: MoveLoc[0](Arg0: I32)
	2: Call tick_math::get_sqrt_price_at_tick(I32): u128
	3: LdU128(0)
	4: Call i128::from(u128): I128
	5: LdU128(0)
	6: LdU128(0)
	7: LdU128(0)
	8: LdU128(0)
	9: VecPack(14, 0)
	10: Pack[1](Tick)
	11: Ret
}

default_rewards_growth_outside(Arg0: u64): vector<u128> {
L1:	loc0: vector<u128>
L2:	loc1: u64
L3:	loc2: vector<u128>
B0:
	0: CopyLoc[0](Arg0: u64)
	1: LdU64(0)
	2: Le
	3: BrFalse(7)
B1:
	4: VecPack(14, 0)
	5: StLoc[1](loc0: vector<u128>)
	6: Branch(26)
B2:
	7: VecPack(14, 0)
	8: StLoc[3](loc2: vector<u128>)
	9: LdU64(0)
	10: StLoc[2](loc1: u64)
B3:
	11: CopyLoc[2](loc1: u64)
	12: CopyLoc[0](Arg0: u64)
	13: Lt
	14: BrFalse(24)
B4:
	15: Branch(16)
B5:
	16: MutBorrowLoc[3](loc2: vector<u128>)
	17: LdU128(0)
	18: VecPushBack(14)
	19: MoveLoc[2](loc1: u64)
	20: LdU64(1)
	21: Add
	22: StLoc[2](loc1: u64)
	23: Branch(11)
B6:
	24: MoveLoc[3](loc2: vector<u128>)
	25: StLoc[1](loc0: vector<u128>)
B7:
	26: MoveLoc[1](loc0: vector<u128>)
	27: Ret
}

tick_score(Arg0: I32): u64 {
L1:	loc0: bool
L2:	loc1: u32
B0:
	0: MoveLoc[0](Arg0: I32)
	1: Call tick_math::tick_bound(): u32
	2: Call i32::from(u32): I32
	3: Call i32::add(I32, I32): I32
	4: Call i32::as_u32(I32): u32
	5: StLoc[2](loc1: u32)
	6: CopyLoc[2](loc1: u32)
	7: LdU32(0)
	8: Ge
	9: BrFalse(17)
B1:
	10: CopyLoc[2](loc1: u32)
	11: Call tick_math::tick_bound(): u32
	12: LdU32(2)
	13: Mul
	14: Le
	15: StLoc[1](loc0: bool)
	16: Branch(19)
B2:
	17: LdFalse
	18: StLoc[1](loc0: bool)
B3:
	19: MoveLoc[1](loc0: bool)
	20: BrFalse(22)
B4:
	21: Branch(24)
B5:
	22: LdConst[2](u64: 2)
	23: Abort
B6:
	24: MoveLoc[2](loc1: u32)
	25: CastU64
	26: Ret
}

Constants [
	0 => u64: 0
	1 => u64: 1
	2 => u64: 2
	3 => u64: 3
]
}

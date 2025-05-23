module 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::clmm_math {
    public fun compute_swap_step(arg0: u128, arg1: u128, arg2: u128, arg3: u64, arg4: u64, arg5: bool, arg6: bool) : (u64, u64, u128, u64) {
        if (arg2 == 0 || arg0 == arg1) {
            return (0, 0, arg1, 0)
        };
        if (arg5) {
            assert!(arg0 > arg1, 4);
        } else {
            assert!(arg0 < arg1, 4);
        };
        let (v0, v1, v2, v3) = if (arg6) {
            let v4 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u64::mul_div_floor(arg3, 1000000 - arg4, 1000000);
            let v5 = get_delta_up_from_input(arg0, arg1, arg2, arg5);
            let (v0, v2, v3) = if (v5 > (v4 as u256)) {
                (v4, arg3 - v4, get_next_sqrt_price_from_input(arg0, arg2, v4, arg5))
            } else {
                let v6 = (v5 as u64);
                (v6, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u64::mul_div_ceil(v6, arg4, 1000000 - arg4), arg1)
            };
            let v7 = get_delta_down_from_output(arg0, v3, arg2, arg5);
            assert!(v7 <= 18446744073709551615, 6);
            (v0, v1, v2, v3)
        } else {
            let v8 = get_delta_down_from_output(arg0, arg1, arg2, arg5);
            let (v1, v3) = if (v8 > (arg3 as u256)) {
                (arg3, get_next_sqrt_price_from_output(arg0, arg2, arg3, arg5))
            } else {
                ((v8 as u64), arg1)
            };
            let v9 = get_delta_up_from_input(arg0, v3, arg2, arg5);
            assert!(v9 <= 18446744073709551615, 6);
            let _ = (v9 as u64);
            (v0, v1, v2, v3)
        };
        (v0, v1, v3, v2)
    }
    
    public fun fee_rate_denominator() : u64 {
        1000000
    }
    
    public fun get_amount_by_liquidity(arg0: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg1: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg2: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg3: u128, arg4: u128, arg5: bool) : (u64, u64) {
        if (arg4 == 0) {
            return (0, 0)
        };
        if (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::lt(arg2, arg0)) {
            (get_delta_a(0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg0), 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg1), arg4, arg5), 0)
        } else {
            let (v2, v3) = if (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::lt(arg2, arg1)) {
                (get_delta_a(arg3, 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg1), arg4, arg5), get_delta_b(0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg0), arg3, arg4, arg5))
            } else {
                (0, get_delta_b(0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg0), 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg1), arg4, arg5))
            };
            (v2, v3)
        }
    }
    
    public fun get_delta_a(arg0: u128, arg1: u128, arg2: u128, arg3: bool) : u64 {
        let v0 = if (arg0 > arg1) {
            arg0 - arg1
        } else {
            arg1 - arg0
        };
        if (v0 == 0 || arg2 == 0) {
            return 0
        };
        let (v1, v2) = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::checked_shlw(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg2, v0));
        if (v2) {
            abort 2
        };
        (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::div_round(v1, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg0, arg1), arg3) as u64)
    }
    
    public fun get_delta_b(arg0: u128, arg1: u128, arg2: u128, arg3: bool) : u64 {
        let v0 = if (arg0 > arg1) {
            arg0 - arg1
        } else {
            arg1 - arg0
        };
        if (v0 == 0 || arg2 == 0) {
            return 0
        };
        let v1 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg2, v0);
        if (arg3 && v1 & 18446744073709551615 > 0) {
            return (((v1 >> 64) + 1) as u64)
        };
        ((v1 >> 64) as u64)
    }
    
    public fun get_delta_down_from_output(arg0: u128, arg1: u128, arg2: u128, arg3: bool) : u256 {
        let v0 = if (arg0 > arg1) {
            arg0 - arg1
        } else {
            arg1 - arg0
        };
        if (v0 == 0 || arg2 == 0) {
            return 0
        };
        if (arg3) {
            0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg2, v0) >> 64
        } else {
            let (v2, v3) = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::checked_shlw(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg2, v0));
            if (v3) {
                abort 2
            };
            0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::div_round(v2, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg0, arg1), false)
        }
    }
    
    public fun get_delta_up_from_input(arg0: u128, arg1: u128, arg2: u128, arg3: bool) : u256 {
        let v0 = if (arg0 > arg1) {
            arg0 - arg1
        } else {
            arg1 - arg0
        };
        if (v0 == 0 || arg2 == 0) {
            return 0
        };
        if (arg3) {
            let (v2, v3) = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::checked_shlw(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg2, v0));
            if (v3) {
                abort 2
            };
            0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::div_round(v2, 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg0, arg1), true)
        } else {
            let v4 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg2, v0);
            if (v4 & 18446744073709551615 > 0) {
                return (v4 >> 64) + 1
            };
            v4 >> 64
        }
    }
    
    public fun get_liquidity_by_amount(arg0: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg1: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg2: 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::I32, arg3: u128, arg4: u64, arg5: bool) : (u128, u64, u64) {
        let v0 = 0;
        let v1 = 0;
        let v2 = if (arg5) {
            v0 = arg4;
            if (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::lt(arg2, arg0)) {
                get_liquidity_from_a(0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg0), 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg1), arg4, false)
            } else {
                assert!(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::lt(arg2, arg1), 3018);
                let v3 = get_liquidity_from_a(arg3, 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg1), arg4, false);
                v1 = get_delta_b(arg3, 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg0), v3, true);
                v3
            }
        } else {
            v1 = arg4;
            if (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::gte(arg2, arg1)) {
                get_liquidity_from_b(0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg0), 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg1), arg4, false)
            } else {
                assert!(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::i32::gte(arg2, arg0), 3018);
                let v4 = get_liquidity_from_b(0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg0), arg3, arg4, false);
                v0 = get_delta_a(arg3, 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::get_sqrt_price_at_tick(arg1), v4, true);
                v4
            }
        };
        (v2, v0, v1)
    }
    
    public fun get_liquidity_from_a(arg0: u128, arg1: u128, arg2: u64, arg3: bool) : u128 {
        let v0 = if (arg0 > arg1) {
            arg0 - arg1
        } else {
            arg1 - arg0
        };
        (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::div_round((0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg0, arg1) >> 64) * (arg2 as u256), (v0 as u256), arg3) as u128)
    }
    
    public fun get_liquidity_from_b(arg0: u128, arg1: u128, arg2: u64, arg3: bool) : u128 {
        let v0 = if (arg0 > arg1) {
            arg0 - arg1
        } else {
            arg1 - arg0
        };
        (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::div_round((arg2 as u256) << 64, (v0 as u256), arg3) as u128)
    }
    
    public fun get_next_sqrt_price_a_up(arg0: u128, arg1: u128, arg2: u64, arg3: bool) : u128 {
        if (arg2 == 0) {
            return arg0
        };
        let (v0, v1) = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::checked_shlw(0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg0, arg1));
        if (v1) {
            abort 2
        };
        let v2 = (arg1 as u256) << 64;
        let v3 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::full_math_u128::full_mul(arg0, (arg2 as u128));
        let v4 = if (arg3) {
            (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::div_round(v0, v2 + v3, true) as u128)
        } else {
            if (v2 < v3) {
                abort 5
            };
            (0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u256::div_round(v0, v2 - v3, true) as u128)
        };
        if (v4 > 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::max_sqrt_price()) {
            abort 0
        };
        if (v4 < 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::min_sqrt_price()) {
            abort 1
        };
        v4
    }
    
    public fun get_next_sqrt_price_b_down(arg0: u128, arg1: u128, arg2: u64, arg3: bool) : u128 {
        let v0 = 0x714a63a0dba6da4f017b42d5d0fb78867f18bcde904868e51d951a5a6f5b7f57::math_u128::checked_div_round((arg2 as u128) << 64, arg1, !arg3);
        let v1 = if (arg3) {
            arg0 + v0
        } else {
            if (arg0 < v0) {
                abort 5
            };
            arg0 - v0
        };
        if (v1 > 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::max_sqrt_price()) {
            abort 0
        };
        if (v1 < 0x1eabed72c53feb3805120a081dc15963c204dc8d091542592abaf7a35689b2fb::tick_math::min_sqrt_price()) {
            abort 1
        };
        v1
    }
    
    public fun get_next_sqrt_price_from_input(arg0: u128, arg1: u128, arg2: u64, arg3: bool) : u128 {
        if (arg3) {
            get_next_sqrt_price_a_up(arg0, arg1, arg2, true)
        } else {
            get_next_sqrt_price_b_down(arg0, arg1, arg2, true)
        }
    }
    
    public fun get_next_sqrt_price_from_output(arg0: u128, arg1: u128, arg2: u64, arg3: bool) : u128 {
        if (arg3) {
            get_next_sqrt_price_b_down(arg0, arg1, arg2, false)
        } else {
            get_next_sqrt_price_a_up(arg0, arg1, arg2, false)
        }
    }
    
    // decompiled from Move bytecode v6
}

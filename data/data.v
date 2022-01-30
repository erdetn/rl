// Copyright(C) 2022 Erdet Nasufi. All rights reserved.

module data

import rl

fn C.CompressData(data &char, data_length int, comp_data_length &int) &char
fn C.DecompressData(comp_data &char, comp_data_length int, data_length &int) &char
fn C.EncodeDataBase64(data &char, data_length int, output_length &int) &char
fn C.DecodeDataBase64(data &char, output_length &int) &char

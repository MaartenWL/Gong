//
//  MIDINote.swift
//  Gong
//
//  Created by Daniel Clelland on 20/04/17.
//  Copyright © 2017 Daniel Clelland. All rights reserved.
//

import Foundation

public struct MIDINote: MIDIChannelEvent, MIDIDurationEvent {
    
    public var channel: MIDIChannel
    
    public var key: MIDIKey
    
    public var velocity: MIDIValue
    
    public var time: MIDITime
    
    public var duration: MIDIDuration
    
    public init(channel: MIDIChannel = .zero, key: MIDIKey, velocity: MIDIValue = .max, time: MIDITime = .now, duration: MIDIDuration = .whole) {
        self.channel = channel
        self.key = key
        self.velocity = velocity
        self.time = time
        self.duration = duration
    }

}

extension MIDINote {
    
    public var packets: [MIDIPacket] {
        return [
            MIDIPacket(.noteOn(channel: UInt8(channel.value), key: UInt8(key.value), velocity: UInt8(velocity.value)), delay: time.value),
            MIDIPacket(.noteOff(channel: UInt8(channel.value), key: UInt8(key.value), velocity: UInt8(velocity.value)), delay: (time + duration).value)
        ]
    }
    
}
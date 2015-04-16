using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace FrogsLilyPadOccupency
{
    class FrogLilyPadInfo
    {
        public string Pond { get; set; }

        public string Frog { get; set; }

        public string ResidingPad { get; set; }

        public DateTime PresenceTime { get; set; }

        public bool IsLeaving { get; set; }
    }
}
